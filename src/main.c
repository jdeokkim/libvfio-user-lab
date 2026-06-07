/*
    Copyright (c) 2026 Jaedeok Kim <jdeokkim@protonmail.com>

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program. If not, see <https://www.gnu.org/licenses/>.
*/

/* Includes ===============================================================> */

#include <err.h>
#include <stdio.h>
#include <stdlib.h>

/* ------------------------------------------------------------------------- */

#include <vfio-user/libvfio-user.h>

/* Private Function Prototypes ============================================> */

static void vful_log(vfu_ctx_t *vfu_ctx, int level, const char *msg);

/* Entry Point ============================================================> */

int main(void) {
    const char *const sock_path = "/tmp/libvfio-user-lab.sock";

    vfu_ctx_t *vfu_ctx = vfu_create_ctx(
        VFU_TRANS_SOCK,
        sock_path,
        0,
        NULL,
        VFU_DEV_TYPE_PCI
    );

    if (vfu_ctx == NULL)
        err(EXIT_FAILURE, "failed to initialize libvfio-user context");

    int ret = vfu_setup_log(vfu_ctx, vful_log, LOG_WARNING);

    if (ret < 0)
        err(EXIT_FAILURE, "failed to initialize logger");

    ret = vfu_pci_init(
        vfu_ctx,
        VFU_PCI_TYPE_EXPRESS,
        PCI_HEADER_TYPE_NORMAL,
        0
    );

    if (ret < 0)
        err(EXIT_FAILURE, "failed to initialize PCIe configuration space");

    {
        // TODO: ...
    }

    vfu_destroy_ctx(vfu_ctx);

    return EXIT_SUCCESS;
}

/* Private Functions ======================================================> */

static void vful_log(vfu_ctx_t *vfu_ctx, int level, const char *msg) {
    (void) vfu_ctx;
    (void) level;

    fprintf(stderr, "[%d]: %s\n", getpid(), msg);
}


/* ========================================================================> */
