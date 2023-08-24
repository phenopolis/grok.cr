@[Link(ldflags: "-lgrokj2k -ljpeg -lstdc++")]
lib LibGrok
  alias Codec = Object
  alias IOCallback = (LibC::UInt, IOBuf, Void* -> Bool)
  alias IOPixelsCallback = (LibC::UInt, IOBuf, Void* -> Bool)
  alias IORegisterReclaimCallback = (IOInit, IOCallback, Void*, Void* -> Void)
  alias MsgCallback = (LibC::Char*, Void* -> Void)
  alias PluginCompressUserCallback = (PluginCompressUserCallbackInfo* -> LibC::ULong)
  alias PluginDecompressCallback = (PluginDecompressCallbackInfo* -> LibC::Int)
  alias StreamFreeUserDataFn = (Void* -> Void)
  alias StreamReadFn = (UInt8*, LibC::SizeT, Void* -> LibC::SizeT)
  alias StreamSeekFn = (LibC::ULong, Void* -> Bool)
  alias StreamWriteFn = (UInt8*, LibC::SizeT, Void* -> LibC::SizeT)
  alias GrokInitDecompressors = (HeaderInfo*, Image* -> LibC::Int)
  enum ChannelAssoc
    ChannelAssocWholeImage   =     0
    ChannelAssocColour1      =     1
    ChannelAssocColour2      =     2
    ChannelAssocColour3      =     3
    ChannelAssocUnassociated = 65535
  end
  enum ChannelType
    ChannelTypeColour               =     0
    ChannelTypeOpacity              =     1
    ChannelTypePremultipliedOpacity =     2
    ChannelTypeUnspecified          = 65535
  end
  enum CodecFormat
    CodecUnk = 0
    CodecJ2K = 1
    CodecJP2 = 2
  end
  enum ColorSpace
    ClrspcUnknown    = 0
    ClrspcSRGB       = 2
    ClrspcGray       = 3
    ClrspcSYCC       = 4
    ClrspcEYCC       = 5
    ClrspcCMYK       = 6
    ClrspcDefaultCIE = 7
    ClrspcCustomCIE  = 8
    ClrspcICC        = 9
  end
  enum PrecisionMode
    PrecModeClip  = 0
    PrecModeScale = 1
  end
  enum ProgOrder
    ProgUnknown          = -1
    Lrcp                 =  0
    Rlcp                 =  1
    Rpcl                 =  2
    Pcrl                 =  3
    Cprl                 =  4
    NumProgressionOrders =  5
  end
  enum RateControlAlgorithm
    RateControlBisect  = 0
    RateControlPcrdOpt = 1
  end
  enum SupportedFileFmt
    FmtUnk  =  0
    FmtJ2K  =  1
    FmtJP2  =  2
    FmtPXM  =  3
    FmtPGX  =  4
    FmtPAM  =  5
    FmtBMP  =  6
    FmtTIF  =  7
    FmtRAW  =  8
    FmtPNG  =  9
    FmtRAWl = 10
    FmtJPG  = 11
  end
  enum TileCacheStrategy
    TileCacheNone  = 0
    TileCacheImage = 1
  end
  fun compress = grk_compress(codec : Codec*, tile : PluginTile*) : LibC::ULong
  fun compress_init = grk_compress_init(stream_params : StreamParams*, parameters : Cparameters*, p_image : Image*) : Codec*
  fun compress_set_default_params = grk_compress_set_default_params(parameters : Cparameters*)
  fun decompress = grk_decompress(codec : Codec*, tile : PluginTile*) : Bool
  fun decompress_detect_format = grk_decompress_detect_format(file_name : LibC::Char*, fmt : CodecFormat*) : Bool
  fun decompress_get_composited_image = grk_decompress_get_composited_image(codec : Codec*) : Image*
  fun decompress_get_tile_image = grk_decompress_get_tile_image(codec : Codec*, tile_index : LibC::UShort) : Image*
  fun decompress_init = grk_decompress_init(stream_params : StreamParams*, core_params : DecompressCoreParams*) : Codec*
  fun decompress_read_header = grk_decompress_read_header(codec : Codec*, header_info : HeaderInfo*) : Bool
  fun decompress_set_default_params = grk_decompress_set_default_params(parameters : DecompressParameters*)
  fun decompress_set_window = grk_decompress_set_window(codec : Codec*, start_x : LibC::Float, start_y : LibC::Float, end_x : LibC::Float, end_y : LibC::Float) : Bool
  fun decompress_tile = grk_decompress_tile(codec : Codec*, tile_index : LibC::UShort) : Bool
  fun deinitialize = grk_deinitialize
  fun dump_codec = grk_dump_codec(codec : Codec*, info_flag : LibC::UInt, output_stream : File)
  fun image_meta_new = grk_image_meta_new : ImageMeta*
  fun image_new = grk_image_new(numcmpts : LibC::UShort, cmptparms : ImageComp*, clrspc : ColorSpace, alloc_data : Bool) : Image*
  fun initialize = grk_initialize(plugin_path : LibC::Char*, numthreads : LibC::UInt, verbose : Bool)
  fun object_ref = grk_object_ref(obj : Object*) : Object*
  fun object_unref = grk_object_unref(obj : Object*)
  fun plugin_batch_compress = grk_plugin_batch_compress(info : PluginCompressBatchInfo) : LibC::Int
  fun plugin_batch_decompress = grk_plugin_batch_decompress : LibC::Int
  fun plugin_cleanup = grk_plugin_cleanup
  fun plugin_compress = grk_plugin_compress(compress_parameters : Cparameters*, callback : PluginCompressUserCallback) : LibC::Int
  fun plugin_decompress = grk_plugin_decompress(decompress_parameters : DecompressParameters*, callback : PluginDecompressCallback) : LibC::Int
  fun plugin_get_debug_state = grk_plugin_get_debug_state : LibC::UInt
  fun plugin_init = grk_plugin_init(init_info : PluginInitInfo) : Bool
  fun plugin_init_batch_decompress = grk_plugin_init_batch_decompress(input_dir : LibC::Char*, output_dir : LibC::Char*, decompress_parameters : DecompressParameters*, callback : PluginDecompressCallback) : LibC::Int
  fun plugin_load = grk_plugin_load(info : PluginLoadInfo) : Bool
  fun plugin_stop_batch_compress = grk_plugin_stop_batch_compress
  fun plugin_stop_batch_decompress = grk_plugin_stop_batch_decompress
  fun plugin_wait_for_batch_complete = grk_plugin_wait_for_batch_complete
  fun set_default_stream_params = grk_set_default_stream_params(params : StreamParams*)
  fun set_mct = grk_set_MCT(parameters : Cparameters*, encoding_matrix : LibC::Float*, dc_shift : LibC::Int*, nb_comp : LibC::UInt) : Bool
  fun set_msg_handlers = grk_set_msg_handlers(info_callback : MsgCallback, info_user_data : Void*, warn_callback : MsgCallback, warn_user_data : Void*, error_callback : MsgCallback, error_user_data : Void*)
  fun version = grk_version : LibC::Char*

  struct PluginCompressBatchInfo
    input_dir : LibC::Char*
    output_dir : LibC::Char*
    compress_parameters : Cparameters*
    callback : PluginCompressUserCallback
  end

  struct PluginCompressUserCallbackInfo
    input_file_name : LibC::Char*
    output_file_name_is_relative : Bool
    output_file_name : LibC::Char*
    compressor_parameters : Cparameters*
    image : Image*
    tile : PluginTile*
    stream_params : StreamParams
    error_code : LibC::UInt
    transfer_exif_tags : Bool
  end

  struct PluginTileComponent
    num_resolutions : LibC::SizeT
    resolutions : PluginResolution**
  end

  struct Asoc
    level : LibC::UInt
    label : LibC::Char*
    xml : UInt8*
    xml_len : LibC::UInt
  end

  struct ChannelDefinition
    descriptions : ChannelDescription*
    num_channel_descriptions : LibC::UShort
  end

  struct ChannelDescription
    channel : LibC::UShort
    typ : LibC::UShort
    asoc : LibC::UShort
  end

  struct Color
    icc_profile_buf : UInt8*
    icc_profile_len : LibC::UInt
    icc_profile_name : LibC::Char*
    channel_definition : ChannelDefinition*
    palette : PaletteData*
    has_colour_specification_box : Bool
  end

  struct ComponentMappingComp
    component_index : LibC::UShort
    mapping_type : UInt8
    palette_column : UInt8
  end

  struct Cparameters
    tile_size_on : Bool
    tx0 : LibC::UInt
    ty0 : LibC::UInt
    t_width : LibC::UInt
    t_height : LibC::UInt
    numlayers : LibC::UShort
    allocation_by_rate_distoration : Bool
    layer_rate : LibC::Double[100]
    allocation_by_quality : Bool
    layer_distortion : LibC::Double[100]
    comment : LibC::Char*[256]
    comment_len : LibC::UShort[256]
    is_binary_comment : Bool[256]
    num_comments : LibC::SizeT
    csty : UInt8
    numgbits : UInt8
    prog_order : ProgOrder
    progression : Progression[33]
    numpocs : LibC::UInt
    numresolution : UInt8
    cblockw_init : LibC::UInt
    cblockh_init : LibC::UInt
    cblk_sty : UInt8
    irreversible : Bool
    roi_compno : LibC::Int
    roi_shift : LibC::UInt
    res_spec : LibC::UInt
    prcw_init : LibC::UInt[33]
    prch_init : LibC::UInt[33]
    infile : LibC::Char[4096]
    outfile : LibC::Char[4096]
    image_offset_x0 : LibC::UInt
    image_offset_y0 : LibC::UInt
    subsampling_dx : UInt8
    subsampling_dy : UInt8
    decod_format : SupportedFileFmt
    cod_format : SupportedFileFmt
    raw_cp : RawCparameters
    enable_tile_part_generation : Bool
    new_tile_part_progression_divider : UInt8
    mct : UInt8
    mct_data : Void*
    max_cs_size : LibC::ULong
    max_comp_size : LibC::ULong
    rsiz : LibC::UShort
    framerate : LibC::UShort
    write_capture_resolution_from_file : Bool
    capture_resolution_from_file : LibC::Double[2]
    write_capture_resolution : Bool
    capture_resolution : LibC::Double[2]
    write_display_resolution : Bool
    display_resolution : LibC::Double[2]
    apply_icc_ : Bool
    rate_control_algorithm : RateControlAlgorithm
    num_threads : LibC::UInt
    device_id : LibC::Int
    duration : LibC::UInt
    kernel_build_options : LibC::UInt
    repeats : LibC::UInt
    write_plt : Bool
    write_tlm : Bool
    verbose : Bool
    shared_memory_interface : Bool
  end

  struct DecompressCoreParams
    reduce : UInt8
    layers_to_decompress_ : LibC::UShort
    tile_cache_strategy : TileCacheStrategy
    random_access_flags_ : LibC::UInt
    io_buffer_callback : IOPixelsCallback
    io_user_data : Void*
    io_register_client_callback : IORegisterReclaimCallback
  end

  struct DecompressParams
    core : DecompressCoreParams
    infile : LibC::Char[4096]
    outfile : LibC::Char[4096]
    decod_format : CodecFormat
    cod_format : SupportedFileFmt
    dw_x0 : LibC::Float
    dw_x1 : LibC::Float
    dw_y0 : LibC::Float
    dw_y1 : LibC::Float
    tile_index : LibC::UShort
    single_tile_decompress : Bool
    precision : Precision*
    num_precision : LibC::UInt
    force_rgb : Bool
    upsample : Bool
    split_pnm : Bool
    io_xml : Bool
    compression : LibC::UInt
    compression_level : LibC::UInt
    verbose_ : Bool
    device_id : LibC::Int
    duration : LibC::UInt
    kernel_build_options : LibC::UInt
    repeats : LibC::UInt
    num_threads : LibC::UInt
    user_data : Void*
  end

  struct HeaderInfo
    decompress_format : SupportedFileFmt
    force_rgb : Bool
    upsample : Bool
    precision : Precision*
    num_precision : LibC::UInt
    split_by_component : Bool
    single_tile_decompress : Bool
    cblockw_init : LibC::UInt
    cblockh_init : LibC::UInt
    irreversible : Bool
    mct : LibC::UInt
    rsiz : LibC::UShort
    numresolutions : LibC::UInt
    csty : UInt8
    cblk_sty : UInt8
    prcw_init : LibC::UInt[33]
    prch_init : LibC::UInt[33]
    tx0 : LibC::UInt
    ty0 : LibC::UInt
    t_width : LibC::UInt
    t_height : LibC::UInt
    t_grid_width : LibC::UInt
    t_grid_height : LibC::UInt
    max_layers_ : LibC::UShort
    xml_data : UInt8*
    xml_data_len : LibC::SizeT
    num_comments : LibC::SizeT
    comment : LibC::Char*[256]
    comment_len : LibC::UShort[256]
    is_binary_comment : Bool[256]
    asocs : Asoc[256]
    num_asocs : LibC::UInt
  end

  struct Image
    obj : Object
    x0 : LibC::UInt
    y0 : LibC::UInt
    x1 : LibC::UInt
    y1 : LibC::UInt
    numcomps : LibC::UShort
    color_space : ColorSpace
    palette_applied_ : Bool
    channel_definition_applied_ : Bool
    has_capture_resolution : Bool
    capture_resolution : LibC::Double[2]
    has_display_resolution : Bool
    display_resolution : LibC::Double[2]
    decompress_format : SupportedFileFmt
    force_rgb : Bool
    upsample : Bool
    precision : Precision*
    num_precision : LibC::UInt
    has_multiple_tiles : Bool
    split_by_component : Bool
    decompress_num_comps : LibC::UShort
    decompress_width : LibC::UInt
    decompress_height : LibC::UInt
    decompress_prec : UInt8
    decompress_colour_space : ColorSpace
    interleaved_data : IOBuf
    rows_per_strip : LibC::UInt
    rows_per_task : LibC::UInt
    packed_row_bytes : LibC::ULong
    meta : ImageMeta*
    comps : ImageComp*
  end

  struct ImageComp
    x0 : LibC::UInt
    y0 : LibC::UInt
    w : LibC::UInt
    stride : LibC::UInt
    h : LibC::UInt
    dx : UInt8
    dy : UInt8
    prec : UInt8
    sgnd : Bool
    type : ChannelType
    association : ChannelAssoc
    xcrg : LibC::UShort
    ycrg : LibC::UShort
    data : LibC::Int*
  end

  struct ImageMeta
    obj : Object
    color : Color
    iptc_buf : UInt8*
    iptc_len : LibC::SizeT
    xmp_buf : UInt8*
    xmp_len : LibC::SizeT
  end

  struct IOBuf
    data_ : UInt8*
    offset_ : LibC::SizeT
    len_ : LibC::SizeT
    alloc_len_ : LibC::SizeT
    pooled_ : Bool
    index_ : LibC::UInt
  end

  struct IOInit
    max_pooled_requests_ : LibC::UInt
  end

  struct Object
    wrapper : Void*
  end

  struct PaletteData
    lut : LibC::Int*
    num_entries : LibC::UShort
    component_mapping : ComponentMappingComp*
    num_channels : UInt8
    channel_sign : Bool*
    channel_prec : UInt8*
  end

  struct PluginBand
    orientation : UInt8
    num_precincts : LibC::ULong
    precincts : PluginPrecinct**
    stepsize : LibC::Float
  end

  struct PluginCodeBlock
    x0 : LibC::UInt
    y0 : LibC::UInt
    x1 : LibC::UInt
    y1 : LibC::UInt
    context_stream : LibC::UInt*
    num_pix : LibC::UInt
    compressed_data : UInt8*
    compressed_data_length : LibC::UInt
    num_bit_planes : UInt8
    num_passes : LibC::SizeT
    passes : PluginPass[67]
    sorted_index : LibC::UInt
  end

  struct PluginDecompressCallbackInfo
    device_id : LibC::SizeT
    init_decompressors_func : GrokInitDecompressors
    input_file_name : LibC::Char*
    output_file_name : LibC::Char*
    decod_format : CodecFormat
    cod_format : SupportedFileFmt
    codec : Codec*
    header_info : HeaderInfo
    decompressor_parameters : DecompressParameters*
    image : Image*
    plugin_owns_image : Bool
    tile : PluginTile*
    error_code : LibC::UInt
    decompress_flags : LibC::UInt
    full_image_x0 : LibC::UInt
    full_image_y0 : LibC::UInt
    user_data : Void*
  end

  struct PluginInitInfo
    device_id : LibC::Int
    verbose : Bool
    license : LibC::Char*
    server : LibC::Char*
  end

  struct PluginLoadInfo
    plugin_path : LibC::Char*
    verbose : Bool
  end

  struct PluginPass
    distortion_decrease : LibC::Double
    rate : LibC::SizeT
    length : LibC::SizeT
  end

  struct PluginPrecinct
    num_blocks : LibC::ULong
    blocks : PluginCodeBlock**
  end

  struct PluginResolution
    level : LibC::SizeT
    num_bands : LibC::SizeT
    band : PluginBand**
  end

  struct PluginTile
    decompress_flags : LibC::UInt
    num_components : LibC::SizeT
    tile_components : PluginTileComponent**
  end

  struct Precision
    prec : UInt8
    mode : PrecisionMode
  end

  struct Progression
    progression : ProgOrder
    progression_string : LibC::Char[5]
    specified_compression_poc_prog : ProgOrder
    tileno : LibC::UInt
    tx0 : LibC::UInt
    ty0 : LibC::UInt
    tx1 : LibC::UInt
    ty1 : LibC::UInt
    comp_s : LibC::UShort
    comp_e : LibC::UShort
    res_s : UInt8
    res_e : UInt8
    prec_s : LibC::ULong
    prec_e : LibC::ULong
    lay_s : LibC::UShort
    lay_e : LibC::UShort
    tp_comp_s : LibC::UShort
    tp_comp_e : LibC::UShort
    tp_res_s : UInt8
    tp_res_e : UInt8
    tp_prec_e : LibC::ULong
    tp_lay_e : LibC::UShort
    tp_tx_s : LibC::UInt
    tp_tx_e : LibC::UInt
    tp_ty_s : LibC::UInt
    tp_ty_e : LibC::UInt
    dx : LibC::UInt
    dy : LibC::UInt
    comp_temp : LibC::UShort
    res_temp : UInt8
    prec_temp : LibC::ULong
    lay_temp : LibC::UShort
    tx0_temp : LibC::UInt
    ty0_temp : LibC::UInt
  end

  struct RawCompCparameters
    dx : UInt8
    dy : UInt8
  end

  struct RawCparameters
    width : LibC::UInt
    height : LibC::UInt
    numcomps : LibC::UShort
    prec : UInt8
    sgnd : Bool
    comps : RawCompCparameters*
  end

  struct StreamParams
    file : LibC::Char*
    buf : UInt8*
    buf_len : LibC::SizeT
    buf_compressed_len : LibC::SizeT
    read_fn : StreamReadFn
    write_fn : StreamWriteFn
    seek_fn : StreamSeekFn
    free_user_data_fn : StreamFreeUserDataFn
    user_data : Void*
    stream_len : LibC::SizeT
    double_buffer_len : LibC::SizeT
  end

  type File = Void*
  type DecompressParameters = DecompressParams
end
