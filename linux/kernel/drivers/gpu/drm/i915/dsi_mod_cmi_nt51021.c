/*
 * Copyright ? 2013 Intel Corporation
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice (including the next
 * paragraph) shall be included in all copies or substantial portions of the
 * Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
 * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS IN THE SOFTWARE.
 *
 * Author: Jani Nikula <jani.nikula@intel.com>
 *	   Shobhit Kumar <shobhit.kumar@intel.com>
 *
 *
 */

#include <drm/drmP.h>
#include <drm/drm_crtc.h>
#include <drm/drm_edid.h>
#include <drm/i915_drm.h>
#include <linux/slab.h>
#include <video/mipi_display.h>
#include <asm/intel-mid.h>
#include <linux/gpio.h>
#include "i915_drv.h"
#include "intel_drv.h"
#include "intel_dsi.h"
#include "intel_dsi_cmd.h"
#include "dsi_mod_cmi_nt51021.h"
#include "linux/mfd/intel_mid_pmic.h"
//static u8 nt51021_soft_reset[]={0x01,0x00};
void  nt51021_vid_get_panel_info(int pipe, struct drm_connector *connector)
{
	if (!connector)
		return;

	if (pipe == 0) {
		connector->display_info.width_mm = 120;
		connector->display_info.height_mm = 192;
	}

	return;
}

bool nt51021_init(struct intel_dsi_device *dsi)
{
	struct intel_dsi *intel_dsi = container_of(dsi, struct intel_dsi, dev);
	struct drm_device *dev = intel_dsi->base.base.dev;
	struct drm_i915_private *dev_priv = dev->dev_private;
	/* create private data, slam to dsi->dev_priv. could support many panels
	 * based on dsi->name. This panal supports both command and video mode,
	 * so check the type. */

	/* where to get all the board info style stuff:
	 *
	 * - gpio numbers, if any (external te, reset)
	 * - pin config, mipi lanes
	 * - dsi backlight? (->create another bl device if needed)
	 * - esd interval, ulps timeout
	 *
	 */
	DRM_DEBUG_KMS("\n");
	printk(KERN_ERR "[yxw test0423]====%s=======\n",__func__);
	
	intel_dsi->hs = true;
	intel_dsi->channel = 0;
	intel_dsi->lane_count = 4;
	intel_dsi->eotp_pkt = 0;
	intel_dsi->port_bits = 0;
	intel_dsi->video_mode_type = DSI_VIDEO_NBURST_SPULSE;
	intel_dsi->pixel_format = VID_MODE_FORMAT_RGB888;
	intel_dsi->turn_arnd_val = 0x14;
	intel_dsi->rst_timer_val = 0xffff;
	intel_dsi->hs_to_lp_count = 0x46;
	intel_dsi->lp_byte_clk = 1;
	intel_dsi->bw_timer = 0x820;
	intel_dsi->clk_lp_to_hs_count = 0xa;
	intel_dsi->clk_hs_to_lp_count = 0x14;
	intel_dsi->video_frmt_cfg_bits = 0;
	intel_dsi->dphy_reg = 0x3c1fc51f;
	intel_dsi->port = 0; /* PORT_A by default */
	intel_dsi->burst_mode_ratio = 100;
	intel_dsi->backlight_on_delay = 80;
	intel_dsi->backlight_off_delay = 20;
	intel_dsi->send_shutdown = true;
	intel_dsi->shutdown_pkt_delay = 20;
	dev_priv->intel_dsi_cabc_dpst = intel_dsi;
	dev_priv->intel_dsi_cabc_dpst->hs =true;
	dev_priv->lcd_flag = gpio_get_value(51);  /*the sec lcd'id is 0, mozuyuan 20140915*/
	
    printk(KERN_ERR "[yxw test0423]====%s=======, lcd_flag = %d\n",__func__, dev_priv->lcd_flag);
	return true;
}

void nt51021_create_resources(struct intel_dsi_device *dsi) { }
void nt51021_enable(struct intel_dsi_device *dsi)
{
	struct intel_dsi *intel_dsi = container_of(dsi, struct intel_dsi, dev);
	struct drm_device *dev = intel_dsi->base.base.dev;
	struct drm_i915_private *dev_priv = dev->dev_private;
	intel_dsi->hs =true;    /*high speed mode*/
	if ((dev_priv->spark_cabc_dpst_on)){
	    	/*bl brightness */
	    	dsi_vc_dcs_write_1(intel_dsi,0,0x01,0x00);
		msleep(5);
	    	dsi_vc_dcs_write_1(intel_dsi,0,0x83,0x00);
	    	dsi_vc_dcs_write_1(intel_dsi,0,0x84,0x00);
		msleep(5);
	    	dsi_vc_dcs_write_1(intel_dsi,0,0x9F,0x7F);
	    	dsi_vc_dcs_write_1(intel_dsi,0,0x97,0xFF);
	    	/*CABC on moving*/
	    	dsi_vc_dcs_write_1(intel_dsi,0,0x83,0xBB);
	    	dsi_vc_dcs_write_1(intel_dsi,0,0x84,0x22);
		msleep(5);
	    	dsi_vc_dcs_write_1(intel_dsi,0,0x90,0x00);
	    	dsi_vc_dcs_write_1(intel_dsi,0,0x91,0xA2);
	    	dsi_vc_dcs_write_1(intel_dsi,0,0x94,0x39);
	    	dsi_vc_dcs_write_1(intel_dsi,0,0x95,0x20);
	    	dsi_vc_dcs_write_1(intel_dsi,0,0x96,0x01);
		dsi_vc_dcs_write_1(intel_dsi,0,0x9A,0x10);
	    	dsi_vc_dcs_write_1(intel_dsi,0,0x9B,0x8C);
		msleep(5);
		dsi_vc_dcs_write_1(intel_dsi,0,0xA1,0xFF);
		dsi_vc_dcs_write_1(intel_dsi,0,0xA2,0xF5);
		dsi_vc_dcs_write_1(intel_dsi,0,0xA3,0xEB);
		dsi_vc_dcs_write_1(intel_dsi,0,0xA4,0xE2);
		dsi_vc_dcs_write_1(intel_dsi,0,0xA5,0xD9);
		dsi_vc_dcs_write_1(intel_dsi,0,0xA6,0xD1);
		dsi_vc_dcs_write_1(intel_dsi,0,0xA7,0xC9);
		dsi_vc_dcs_write_1(intel_dsi,0,0xA8,0xC1);
		dsi_vc_dcs_write_1(intel_dsi,0,0xA9,0xBA);
		dsi_vc_dcs_write_1(intel_dsi,0,0xAA,0xB3);
		dsi_vc_dcs_write_1(intel_dsi,0,0xB4,0x2E);
		dsi_vc_dcs_write_1(intel_dsi,0,0xB5,0x5C);
		dsi_vc_dcs_write_1(intel_dsi,0,0xB6,0x4F);
	}

	/*mipi yantu*/
	dsi_vc_dcs_write_1(intel_dsi,0,0x83,0xAA);
	dsi_vc_dcs_write_1(intel_dsi,0,0x84,0x11);
	msleep(5);
	if(dev_priv->lcd_flag){
		dsi_vc_dcs_write_1(intel_dsi,0,0xA0,0x2D);
		dsi_vc_dcs_write_1(intel_dsi,0,0xA1,0x2D);
	}
	dsi_vc_dcs_write_1(intel_dsi,0,0xA9,0x4B);//lm for noise
	
	
	/*BOE CE*/
	if(!dev_priv->lcd_flag){
	    	dsi_vc_dcs_write_1(intel_dsi,0,0x83,0xcc);
	    	dsi_vc_dcs_write_1(intel_dsi,0,0x84,0x33);
	    	msleep(5);
	    	dsi_vc_dcs_write_1(intel_dsi,0,0x90,0x1f);
	    	dsi_vc_dcs_write_1(intel_dsi,0,0x92,0x0f);
	    	dsi_vc_dcs_write_1(intel_dsi,0,0x93,0x0f);
	    	dsi_vc_dcs_write_1(intel_dsi,0,0x94,0x07);
	    	dsi_vc_dcs_write_1(intel_dsi,0,0x95,0x09);
	    	dsi_vc_dcs_write_1(intel_dsi,0,0x96,0x0d);
	    	dsi_vc_dcs_write_1(intel_dsi,0,0x97,0x06);
	}
	msleep(5);

	return;
}

void nt51021_dpms(struct intel_dsi_device *dsi, bool enable)
{
	struct intel_dsi *intel_dsi = container_of(dsi, struct intel_dsi, dev);

	DRM_DEBUG_KMS("\n");

	if (enable) {

		dsi_vc_dcs_write_0(intel_dsi, 0, MIPI_DCS_EXIT_SLEEP_MODE);

		dsi_vc_dcs_write_1(intel_dsi, 0, MIPI_DCS_SET_TEAR_ON, 0x00);

		dsi_vc_dcs_write_0(intel_dsi, 0, MIPI_DCS_SET_DISPLAY_ON);
		dsi_vc_dcs_write_1(intel_dsi, 0, 0x14, 0x55);
		//dsi_vc_generic_write_2(intel_dsi, 0, nt51021_soft_reset[0], nt51021_soft_reset[1]); //soft reset

	} else {
		dsi_vc_dcs_write_0(intel_dsi, 0, MIPI_DCS_SET_DISPLAY_OFF);
		dsi_vc_dcs_write_0(intel_dsi, 0, MIPI_DCS_ENTER_SLEEP_MODE);
	}
}

int nt51021_mode_valid(struct intel_dsi_device *dsi,
		   struct drm_display_mode *mode)
{
	return MODE_OK;
}

bool nt51021_mode_fixup(struct intel_dsi_device *dsi,
		    const struct drm_display_mode *mode,
		    struct drm_display_mode *adjusted_mode)
{
	struct intel_dsi *intel_dsi = container_of(dsi, struct intel_dsi, dev);

	if (BYT_CR_CONFIG) {
		adjusted_mode->hdisplay = 1200;
		adjusted_mode->vdisplay = 1920;
		 /*if (!vvx09f006a00_load_timing(adjusted_mode)) {
			printk("Panasonic panel fixup: Load timing failed\n");
			return false;
		}

		printk("Panasonic panel fixup: %dx%d (adjusted mode)",
			adjusted_mode->hdisplay, adjusted_mode->vdisplay);*/
	}
	intel_dsi->pclk = adjusted_mode->clock;
	printk("pclk : %d\n", intel_dsi->pclk);
	return true;
}

enum drm_connector_status nt51021_detect(struct intel_dsi_device *dsi)
{
	return connector_status_connected;
}

bool nt51021_get_hw_state(struct intel_dsi_device *dev)
{
	return true;
}

struct drm_display_mode *nt51021_get_modes(struct intel_dsi_device *dsi)
{
    struct intel_dsi *intel_dsi = container_of(dsi, struct intel_dsi, dev);
	struct drm_device *dev = intel_dsi->base.base.dev;
	struct drm_i915_private *dev_priv = dev->dev_private;
	
	struct drm_display_mode *mode = NULL;
    printk("mzy >>>> %s, lcd_falg = %d\n", __func__, dev_priv->lcd_flag);
	/* Allocate */
	mode = kzalloc(sizeof(*mode), GFP_KERNEL);
	if (!mode) {
		DRM_DEBUG_KMS("AUO B101UAN01E Panel: No memory\n");
		return NULL;
	}

    //mzy edit 20140923 for sec's timing
	if(dev_priv->lcd_flag)
	{   
	    mode->hdisplay = 1200;
	    mode->hsync_start = mode->hdisplay + 42;    //fp
	    mode->hsync_end = mode->hsync_start + 1; //sync
	    mode->htotal = mode->hsync_end + 32;  //bp
	    
	    mode->vdisplay = 1920;
        mode->vsync_start = mode->vdisplay + 35;
        mode->vsync_end = mode->vsync_start + 1;
        mode->vtotal = mode->vsync_end + 25;
	}
	else
	{
	    mode->hdisplay = 1200;
	    mode->hsync_start = mode->hdisplay + 110;   //fp
	    mode->hsync_end = mode->hsync_start + 1; //sync
	    mode->htotal = mode->hsync_end + 32;  //bp

        mode->vdisplay = 1920;
        mode->vsync_start = mode->vdisplay + 11;
        mode->vsync_end = mode->vsync_start + 1;
        mode->vtotal = mode->vsync_end + 14;
	}

	mode->vrefresh = 60;
	mode->clock =  mode->vrefresh * mode->vtotal *
		mode->htotal / 1000;

	/* Configure */
	drm_mode_set_name(mode);
	drm_mode_set_crtcinfo(mode, 0);
	mode->type |= DRM_MODE_TYPE_PREFERRED;

	printk("%s drm debug Loaded mode=%dx%d\n",__func__,
		mode->hdisplay, mode->vdisplay);

	return mode;
}

void nt51021_dump_regs(struct intel_dsi_device *dsi) { }

void nt5102_send_otp_cmds(struct intel_dsi_device *dsi)
{

}


void nt51021_destroy(struct intel_dsi_device *dsi) { }

/* Callbacks. We might not need them all. */
struct intel_dsi_dev_ops cmi_nt51021_dsi_display_ops = {//struct intel_dsi_dev_ops auo_nt51021_dsi_display_ops = {
	.init = nt51021_init,
	.get_info = nt51021_vid_get_panel_info,
	.create_resources = nt51021_create_resources,
	.dpms = nt51021_dpms,
	.mode_valid = nt51021_mode_valid,
	.mode_fixup = nt51021_mode_fixup,
	.detect = nt51021_detect,
	.get_hw_state = nt51021_get_hw_state,
	.get_modes = nt51021_get_modes,
	.destroy = nt51021_destroy,
	.dump_regs = nt51021_dump_regs,
	.enable = nt51021_enable,
	.send_otp_cmds = nt5102_send_otp_cmds,
};

