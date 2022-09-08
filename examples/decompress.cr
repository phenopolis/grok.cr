require "../src/grok"

image_path = ARGV[0]
image_data = File.read(image_path)
decompress_core_params = LibGrok::DecompressCoreParams.new
stream_params = LibGrok::StreamParams.new
stream_params.buf = image_data
stream_params.len = image_data.bytesize

LibGrok.decompress_set_default_params(pointerof(decompress_core_params))
LibGrok.initialize(nil, 0)

codec = LibGrok.decompress_init(pointerof(stream_params), pointerof(decompress_core_params))

LibGrok.decompress_read_header(codec, nil)
LibGrok.decompress(codec, nil)

image = LibGrok.decompress_get_composited_image(codec).value

image.numcomps.times do |numcomp|
  comp = image.comps[numcomp]
  data = comp.data.to_slice(comp.w * comp.h)
  puts data.size
end

LibGrok.object_unref(codec)
LibGrok.deinitialize
