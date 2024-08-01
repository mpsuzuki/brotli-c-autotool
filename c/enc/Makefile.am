lib_LTLIBRARIES = libbrotlienc.la
libbrotlienc_la_LIBTOOLFLAGS = @LIBBROTLI_VERSION_INFO@
libbrotlienc_la_SOURCES = \
	backward_references.c backward_references_hq.c \
	bit_cost.c block_splitter.c brotli_bit_stream.c \
	cluster.c command.c compound_dictionary.c \
	compress_fragment.c compress_fragment_two_pass.c \
	dictionary_hash.c encode.c encoder_dict.c \
	entropy_encode.c fast_log.c histogram.c \
	literal_cost.c memory.c metablock.c \
	static_dict.c utf8_util.c \
	\
	backward_references.h backward_references_hq.h \
	backward_references_inc.h bit_cost.h \
	bit_cost_inc.h block_encoder_inc.h \
	block_splitter.h block_splitter_inc.h \
	brotli_bit_stream.h cluster.h cluster_inc.h \
	command.h compound_dictionary.h \
	compress_fragment.h \
	compress_fragment_two_pass.h dictionary_hash.h \
	encoder_dict.h entropy_encode.h \
	entropy_encode_static.h fast_log.h \
	find_match_length.h hash_composite_inc.h \
	hash_forgetful_chain_inc.h hash.h \
	hash_longest_match64_inc.h \
	hash_longest_match64_simd_inc.h \
	hash_longest_match_inc.h \
	hash_longest_match_quickly_inc.h \
	hash_longest_match_simd_inc.h \
	hash_rolling_inc.h hash_to_binary_tree_inc.h \
	histogram.h histogram_inc.h literal_cost.h \
	matching_tag_mask.h memory.h metablock.h \
	metablock_inc.h params.h prefix.h quality.h \
	ringbuffer.h state.h static_dict.h \
	static_dict_lut.h utf8_util.h write_bits.h

AM_CFLAGS = -I$(top_srcdir)/include
