require "../src/grok"

LibGrok.initialize(nil, 0)

image_path = ARGV[0]
image_data = File.read(image_path)
decompress_core_params = LibGrok::DecompressCoreParams.new
stream_params = LibGrok::StreamParams.new
stream_params.buf = image_data
stream_params.len = image_data.bytesize
codec = LibGrok.decompress_init(pointerof(stream_params), pointerof(decompress_core_params))

LibGrok.decompress_read_header(codec, nil)
LibGrok.decompress(codec, nil)

image = LibGrok.decompress_get_composited_image(codec).value

image.numcomps.times do |numcomp|
  channel = [] of Int32
  comp = image.comps[numcomp]

  comp.h.times do
    channel += comp.data.to_slice(comp.w).to_a
    comp.data += comp.stride
  end

  puts channel.size
end

LibGrok.object_unref(codec)
LibGrok.deinitialize
