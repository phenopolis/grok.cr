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
width = image.x1
height = image.y1

image.numcomps.times do |numcomp|
  channel = Pointer.malloc(width * height, 0)
  comp = image.comps[numcomp]

  height.times do
    channel.copy_from(comp.data, comp.stride)
    channel += width
    comp.data += comp.stride
  end
  channel -= height * width

  puts channel.to_slice(width * height).size
end

LibGrok.object_unref(codec)
LibGrok.deinitialize
