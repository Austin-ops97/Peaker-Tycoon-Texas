#include "include/peaker_inflate.h"

#include <string.h>
#include <zlib.h>

int peaker_inflate_raw(const uint8_t *src, size_t src_len, uint8_t *dst, size_t dst_len, size_t *written) {
    z_stream stream;
    int status;
    if (written == NULL) {
        return 1;
    }
    *written = 0;
    if (src_len > 0xffffffffu || dst_len > 0xffffffffu) {
        return 2;
    }
    memset(&stream, 0, sizeof(stream));
    /* Negative window bits: raw DEFLATE, the ZIP method-8 payload. */
    if (inflateInit2(&stream, -MAX_WBITS) != Z_OK) {
        return 3;
    }
    stream.next_in = (Bytef *)src;
    stream.avail_in = (uInt)src_len;
    stream.next_out = dst;
    stream.avail_out = (uInt)dst_len;
    status = inflate(&stream, Z_FINISH);
    *written = stream.total_out;
    inflateEnd(&stream);
    return status == Z_STREAM_END ? 0 : 4;
}

uint32_t peaker_crc32(const uint8_t *src, size_t len) {
    uLong crc = crc32(0L, Z_NULL, 0);
    size_t offset = 0;
    while (offset < len) {
        size_t chunk = len - offset;
        if (chunk > 1 << 20) {
            chunk = 1 << 20;
        }
        crc = crc32(crc, src + offset, (uInt)chunk);
        offset += chunk;
    }
    return (uint32_t)crc;
}
