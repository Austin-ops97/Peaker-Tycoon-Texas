#ifndef PEAKER_INFLATE_H
#define PEAKER_INFLATE_H

#include <stddef.h>
#include <stdint.h>

/* Raw DEFLATE (ZIP method 8). Returns 0 on success. */
int peaker_inflate_raw(const uint8_t *src, size_t src_len, uint8_t *dst, size_t dst_len, size_t *written);

/* ZIP CRC-32. */
uint32_t peaker_crc32(const uint8_t *src, size_t len);

#endif
