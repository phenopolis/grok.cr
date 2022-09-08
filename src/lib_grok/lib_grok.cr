@[Link(ldflags: "-lgrokj2k -lhwy -ljpeg -llcms2 -lstdc++")]
lib LibGrok
  alias Codec = Object
  alias IOCallback = (UInt32T, IOBuf, Void* -> Bool)
  alias IOPixelsCallback = (UInt32T, IOBuf, Void* -> Bool)
  alias IORegisterReclaimCallback = (IOInit, IOCallback, Void*, Void* -> Void)
  alias MsgCallback = (LibC::Char*, Void* -> Void)
  alias PluginCompressUserCallback = (PluginCompressUserCallbackInfo* -> Bool)
  alias PluginDecompressCallback = (PluginDecompressCallbackInfo* -> Int32T)
  alias GrokInitDecompressors = (HeaderInfo*, Image* -> LibC::Int)
  alias IOCodecvt = Void
  alias IOLockT = Void
  alias IOMarker = Void
  alias IOWideData = Void
  alias Int32T = LibC::Int
  alias Off64T = LibC::Long
  alias OffT = LibC::Long
  alias UInt16T = LibC::UShort
  alias UInt32T = LibC::UInt
  alias UInt64T = LibC::ULong
  alias UInt8T = UInt8
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
    CodecUnk = -1
    CodecJ2K =  0
    CodecJP2 =  2
  end
  enum ColorSpace
    ClrspcUnknown    = 0
    ClrspcSrgb       = 2
    ClrspcGray       = 3
    ClrspcSycc       = 4
    ClrspcEycc       = 5
    ClrspcCmyk       = 6
    ClrspcDefaultCie = 7
    ClrspcCustomCie  = 8
    ClrspcIcc        = 9
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
  fun compress = grk_compress(codec : Codec*, tile : PluginTile*) : Bool
  fun compress_init = grk_compress_init(stream_params : StreamParams*, parameters : Cparameters*, p_image : Image*) : Codec*
  fun compress_set_default_params = grk_compress_set_default_params(parameters : Cparameters*)
  fun decompress = grk_decompress(codec : Codec*, tile : PluginTile*) : Bool
  fun decompress_buffer_detect_format = grk_decompress_buffer_detect_format(buffer : UInt8T*, len : LibC::SizeT, fmt : CodecFormat*) : Bool
  fun decompress_detect_format = grk_decompress_detect_format(file_name : LibC::Char*, fmt : CodecFormat*) : Bool
  fun decompress_get_composited_image = grk_decompress_get_composited_image(codec : Codec*) : Image*
  fun decompress_get_tile_image = grk_decompress_get_tile_image(codec : Codec*, tile_index : UInt16T) : Image*
  fun decompress_init = grk_decompress_init(stream_params : StreamParams*, core_params : DecompressCoreParams*) : Codec*
  fun decompress_read_header = grk_decompress_read_header(codec : Codec*, header_info : HeaderInfo*) : Bool
  fun decompress_set_default_params = grk_decompress_set_default_params(parameters : DecompressCoreParams*)
  fun decompress_set_window = grk_decompress_set_window(codec : Codec*, start_x : LibC::Float, start_y : LibC::Float, end_x : LibC::Float, end_y : LibC::Float) : Bool
  fun decompress_tile = grk_decompress_tile(codec : Codec*, tile_index : UInt16T) : Bool
  fun deinitialize = grk_deinitialize
  fun dump_codec = grk_dump_codec(codec : Codec*, info_flag : UInt32T, output_stream : File*)
  fun image_meta_new = grk_image_meta_new : ImageMeta*
  fun image_new = grk_image_new(numcmpts : UInt16T, cmptparms : ImageComp*, clrspc : ColorSpace) : Image*
  fun initialize = grk_initialize(plugin_path : LibC::Char*, numthreads : UInt32T) : Bool
  fun object_ref = grk_object_ref(obj : Object*) : Object*
  fun object_unref = grk_object_unref(obj : Object*)
  fun plugin_batch_compress = grk_plugin_batch_compress(input_dir : LibC::Char*, output_dir : LibC::Char*, compress_parameters : Cparameters*, callback : PluginCompressUserCallback) : Int32T
  fun plugin_batch_decompress = grk_plugin_batch_decompress : Int32T
  fun plugin_cleanup = grk_plugin_cleanup
  fun plugin_compress = grk_plugin_compress(compress_parameters : Cparameters*, callback : PluginCompressUserCallback) : Int32T
  fun plugin_decompress = grk_plugin_decompress(decompress_parameters : DecompressParameters*, callback : PluginDecompressCallback) : Int32T
  fun plugin_get_debug_state = grk_plugin_get_debug_state : UInt32T
  fun plugin_init = grk_plugin_init(init_info : PluginInitInfo) : Bool
  fun plugin_init_batch_decompress = grk_plugin_init_batch_decompress(input_dir : LibC::Char*, output_dir : LibC::Char*, decompress_parameters : DecompressParameters*, callback : PluginDecompressCallback) : Int32T
  fun plugin_is_batch_complete = grk_plugin_is_batch_complete : Bool
  fun plugin_load = grk_plugin_load(info : PluginLoadInfo) : Bool
  fun plugin_stop_batch_compress = grk_plugin_stop_batch_compress
  fun plugin_stop_batch_decompress = grk_plugin_stop_batch_decompress
  fun set_mct = grk_set_MCT(parameters : Cparameters*, encoding_matrix : LibC::Float*, dc_shift : Int32T*, nb_comp : UInt32T) : Bool
  fun set_msg_handlers = grk_set_msg_handlers(info_callback : MsgCallback, info_user_data : Void*, warn_callback : MsgCallback, warn_user_data : Void*, error_callback : MsgCallback, error_user_data : Void*)
  fun version = grk_version : LibC::Char*

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
    level : UInt32T
    label : LibC::Char*
    xml : UInt8T*
    xml_len : UInt32T
  end

  struct ChannelDefinition
    descriptions : ChannelDescription*
    num_channel_descriptions : UInt16T
  end

  struct ChannelDescription
    channel : UInt16T
    typ : UInt16T
    asoc : UInt16T
  end

  struct Color
    icc_profile_buf : UInt8T*
    icc_profile_len : UInt32T
    icc_profile_name : LibC::Char*
    channel_definition : ChannelDefinition*
    palette : PaletteData*
    has_colour_specification_box : Bool
  end

  struct ComponentMappingComp
    component_index : UInt16T
    mapping_type : UInt8T
    palette_column : UInt8T
  end

  struct Cparameters
    tile_size_on : Bool
    tx0 : UInt32T
    ty0 : UInt32T
    t_width : UInt32T
    t_height : UInt32T
    numlayers : UInt16T
    allocation_by_rate_distoration : Bool
    layer_rate : LibC::Double[100]
    allocation_by_quality : Bool
    layer_distortion : LibC::Double[100]
    comment : LibC::Char*[256]
    comment_len : UInt16T[256]
    is_binary_comment : Bool[256]
    num_comments : LibC::SizeT
    csty : UInt8T
    numgbits : UInt8T
    prog_order : ProgOrder
    progression : Progression[33]
    numpocs : UInt32T
    numresolution : UInt8T
    cblockw_init : UInt32T
    cblockh_init : UInt32T
    cblk_sty : UInt8T
    irreversible : Bool
    roi_compno : Int32T
    roi_shift : UInt32T
    res_spec : UInt32T
    prcw_init : UInt32T[33]
    prch_init : UInt32T[33]
    infile : LibC::Char[4096]
    outfile : LibC::Char[4096]
    image_offset_x0 : UInt32T
    image_offset_y0 : UInt32T
    subsampling_dx : UInt8T
    subsampling_dy : UInt8T
    decod_format : SupportedFileFmt
    cod_format : SupportedFileFmt
    raw_cp : RawCparameters
    max_comp_size : UInt32T
    enable_tile_part_generation : Bool
    new_tile_part_progression_divider : UInt8T
    mct : UInt8T
    mct_data : Void*
    max_cs_size : UInt64T
    rsiz : UInt16T
    framerate : UInt16T
    write_capture_resolution_from_file : Bool
    capture_resolution_from_file : LibC::Double[2]
    write_capture_resolution : Bool
    capture_resolution : LibC::Double[2]
    write_display_resolution : Bool
    display_resolution : LibC::Double[2]
    rate_control_algorithm : RateControlAlgorithm
    num_threads : UInt32T
    device_id : Int32T
    duration : UInt32T
    kernel_build_options : UInt32T
    repeats : UInt32T
    write_plt : Bool
    write_tlm : Bool
    verbose : Bool
  end

  struct DecompressCoreParams
    reduce : UInt8T
    max_layers : UInt16T
    tile_cache_strategy : TileCacheStrategy
    random_access_flags_ : UInt32T
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
    tile_index : UInt16T
    single_tile_decompress : Bool
    precision : Precision*
    num_precision : UInt32T
    force_rgb : Bool
    upsample : Bool
    split_pnm : Bool
    io_xml : Bool
    compression : UInt32T
    compression_level : UInt32T
    verbose_ : Bool
    device_id : Int32T
    duration : UInt32T
    kernel_build_options : UInt32T
    repeats : UInt32T
    num_threads : UInt32T
  end

  struct HeaderInfo
    decompress_format : SupportedFileFmt
    force_rgb : Bool
    upsample : Bool
    precision : Precision*
    num_precision : UInt32T
    split_by_component : Bool
    single_tile_decompress : Bool
    cblockw_init : UInt32T
    cblockh_init : UInt32T
    irreversible : Bool
    mct : UInt32T
    rsiz : UInt16T
    numresolutions : UInt32T
    csty : UInt8T
    cblk_sty : UInt8T
    prcw_init : UInt32T[33]
    prch_init : UInt32T[33]
    tx0 : UInt32T
    ty0 : UInt32T
    t_width : UInt32T
    t_height : UInt32T
    t_grid_width : UInt32T
    t_grid_height : UInt32T
    numlayers : UInt16T
    xml_data : UInt8T*
    xml_data_len : LibC::SizeT
    num_comments : LibC::SizeT
    comment : LibC::Char*[256]
    comment_len : UInt16T[256]
    is_binary_comment : Bool[256]
    asocs : Asoc[256]
    num_asocs : UInt32T
  end

  struct Image
    obj : Object
    x0 : UInt32T
    y0 : UInt32T
    x1 : UInt32T
    y1 : UInt32T
    numcomps : UInt16T
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
    num_precision : UInt32T
    has_multiple_tiles : Bool
    split_by_component : Bool
    decompress_num_comps : UInt16T
    decompress_width : UInt32T
    decompress_height : UInt32T
    decompress_prec : UInt8T
    decompress_colour_space : ColorSpace
    interleaved_data : IOBuf
    rows_per_strip : UInt32T
    rows_per_task : UInt32T
    packed_row_bytes : UInt64T
    meta : ImageMeta*
    comps : ImageComp*
  end

  struct ImageComp
    x0 : UInt32T
    y0 : UInt32T
    w : UInt32T
    stride : UInt32T
    h : UInt32T
    dx : UInt8T
    dy : UInt8T
    prec : UInt8T
    sgnd : Bool
    type : ChannelType
    association : ChannelAssoc
    xcrg : UInt16T
    ycrg : UInt16T
    data : Int32T*
  end

  struct ImageMeta
    obj : Object
    color : Color
    iptc_buf : UInt8T*
    iptc_len : LibC::SizeT
    xmp_buf : UInt8T*
    xmp_len : LibC::SizeT
  end

  struct IOBuf
    data_ : UInt8T*
    offset_ : UInt64T
    len_ : UInt64T
    alloc_len_ : UInt64T
    pooled_ : Bool
    index_ : UInt32T
  end

  struct IOInit
    max_pooled_requests_ : UInt32T
  end

  struct Object
    wrapper : Void*
  end

  struct PaletteData
    lut : Int32T*
    num_entries : UInt16T
    component_mapping : ComponentMappingComp*
    num_channels : UInt8T
    channel_sign : Bool*
    channel_prec : UInt8T*
  end

  struct PluginBand
    orientation : UInt8T
    num_precincts : UInt64T
    precincts : PluginPrecinct**
    stepsize : LibC::Float
  end

  struct PluginCodeBlock
    x0 : UInt32T
    y0 : UInt32T
    x1 : UInt32T
    y1 : UInt32T
    context_stream : LibC::UInt*
    num_pix : UInt32T
    compressed_data : UInt8T*
    compressed_data_length : UInt32T
    num_bit_planes : UInt8T
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
    decompress_flags : UInt32T
    full_image_x0 : UInt32T
    full_image_y0 : UInt32T
    user_data : Void*
  end

  struct PluginInitInfo
    device_id : Int32T
    verbose : Bool
  end

  struct PluginLoadInfo
    plugin_path : LibC::Char*
  end

  struct PluginPass
    distortion_decrease : LibC::Double
    rate : LibC::SizeT
    length : LibC::SizeT
  end

  struct PluginPrecinct
    num_blocks : UInt64T
    blocks : PluginCodeBlock**
  end

  struct PluginResolution
    level : LibC::SizeT
    num_bands : LibC::SizeT
    band : PluginBand**
  end

  struct PluginTile
    decompress_flags : UInt32T
    num_components : LibC::SizeT
    tile_components : PluginTileComponent**
  end

  struct Precision
    prec : UInt8T
    mode : PrecisionMode
  end

  struct Progression
    progression : ProgOrder
    progression_string : LibC::Char[5]
    specified_compression_poc_prog : ProgOrder
    tileno : UInt32T
    tx0 : UInt32T
    ty0 : UInt32T
    tx1 : UInt32T
    ty1 : UInt32T
    comp_s : UInt16T
    comp_e : UInt16T
    res_s : UInt8T
    res_e : UInt8T
    prec_s : UInt64T
    prec_e : UInt64T
    lay_s : UInt16T
    lay_e : UInt16T
    tp_comp_s : UInt16T
    tp_comp_e : UInt16T
    tp_res_s : UInt8T
    tp_res_e : UInt8T
    tp_prec_e : UInt64T
    tp_lay_e : UInt16T
    tp_tx_s : UInt32T
    tp_tx_e : UInt32T
    tp_ty_s : UInt32T
    tp_ty_e : UInt32T
    dx : UInt32T
    dy : UInt32T
    comp_temp : UInt16T
    res_temp : UInt8T
    prec_temp : UInt64T
    lay_temp : UInt16T
    tx0_temp : UInt32T
    ty0_temp : UInt32T
  end

  struct RawCompCparameters
    dx : UInt8T
    dy : UInt8T
  end

  struct RawCparameters
    width : UInt32T
    height : UInt32T
    numcomps : UInt16T
    prec : UInt8T
    sgnd : Bool
    comps : RawCompCparameters*
  end

  struct StreamParams
    file : LibC::Char*
    buf : UInt8T*
    len : LibC::SizeT
  end

  struct IOFile
    _flags : LibC::Int
    _io_read_ptr : LibC::Char*
    _io_read_end : LibC::Char*
    _io_read_base : LibC::Char*
    _io_write_base : LibC::Char*
    _io_write_ptr : LibC::Char*
    _io_write_end : LibC::Char*
    _io_buf_base : LibC::Char*
    _io_buf_end : LibC::Char*
    _io_save_base : LibC::Char*
    _io_backup_base : LibC::Char*
    _io_save_end : LibC::Char*
    _markers : IOMarker*
    _chain : IOFile*
    _fileno : LibC::Int
    _flags2 : LibC::Int
    _old_offset : OffT
    _cur_column : LibC::UShort
    _vtable_offset : LibC::Char
    _shortbuf : LibC::Char[1]
    _lock : IOLockT*
    _offset : Off64T
    _codecvt : IOCodecvt*
    _wide_data : IOWideData*
    _freeres_list : IOFile*
    _freeres_buf : Void*
    __pad5 : LibC::SizeT
    _mode : LibC::Int
    _unused2 : LibC::Char[20]
  end

  type File = IOFile
  type DecompressParameters = DecompressParams
end
