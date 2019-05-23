module Pdf2htmlDocker
  CONVERTER_ARGS = [':pdf', ':html'].freeze

  CONVERTER_OPTIONS = {
    first_page: '--first-page',
    last_page: '--last-page',
    zoom: '--zoom',
    fit_height: '--fit-height',
    use_cropbox: '--use-cropbox',
    hdpi: '--hdpi',
    vdpi: '--vdpi',
    embed: '--embed',
    embed_css: '--embed-css',
    embed_font: '--embed-font',
    embed_image: '--embed-image',
    embed_javascript: '--embed-javascript',
    embed_outline: '--embed-outline',
    split_pages: '--split-pages',
    dest_dir: '--dest-dir',
    css_filename: '--css-filename',
    page_filename: '--page-filename',
    outline_filename: '--outline-filename',
    process_nontext: '--process-nontext',
    process_outline: '--process-outline',
    process_annotation: '--process-annotation',
    process_form: '--process-form',
    printing: '--printing',
    fallback: '--fallback',
    tmp_file_size_limit: '--tmp-file-size-limit',
    embed_external_font: '--embed-external-font',
    font_format: '--font-format',
    decomponse_ligature: '--decompose-ligature',
    auto_hint: '--auto-hint',
    external_hint_tool: '--external-hint-tool',
    stretch_narrow_glyph: '--stretch-narrow-glyph',
    squeeze_wide_glyph: '--squeeze-wide-glyph',
    override_fstype: '--override-fstype',
    process_type3: '--process-type3',
    heps: '--heps',
    veps: '--veps',
    space_threshold: '--space-threshold',
    font_size_multiplier: '--font-size-multiplier',
    space_as_offset: '--space-as-offset',
    tounicode: '--tounicode',
    optimize_text: '--optimize-text',
    correct_text_visibility: '--correct-text-visibility',
    bg_format: '--bg-format',
    svg_node_count_limit: '--svg-node-count-limit',
    svg_embed_bitmap: '--svg-embed-bitmap',
    owner_password: '--owner-password',
    user_password: '--user-password',
    no_drm: '--no-drm',
    clear_tmp: '--clean-tmp',
    tmp_dir: '--tmp-dir',
    data_dir: '--data-dir',
    debug: '--debug',
    proof: '--proof',
    version: '--version',
    help: '--help'
  }.freeze

  class OptionBuilder
    attr_reader :keys

    def initialize(args, options = {})
      @keys = (CONVERTER_OPTIONS.keys & options.keys) + CONVERTER_ARGS
      @options = normalize_options(options)
      @args = args
    end

    def to_s
      return '' if @keys.empty?

      (array_from_options(@options, CONVERTER_OPTIONS) +
        CONVERTER_ARGS).join(' ')
    end

    def to_h
      @options.merge(@args)
    end

    private

      def normalize_options(options)
        return {} if options.nil? || @keys.nil?

        @keys.each_with_object({}) do |f, hash|
          hash[f] = options[f].to_s unless options[f].nil?
        end
      end

      def array_from_options(hash, opts = hash)
        hash.flat_map do |key, _val|
          [opts[key].to_s, key.to_sym.inspect.to_s]
        end
      end
  end
end
