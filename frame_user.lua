local curtime = elapsed_time
local curframe = frame


if ((do_animation == 1) and (buf_A > 0) and (shadertoy_prog_buf_a > 0)) then

  gh_render_target.bind(buf_A)
  --gh_renderer.clear_color_depth_buffers(0.0, 0.0, 0.0, 0.0, 1.0)

  gh_gpu_program.bind(shadertoy_prog_buf_a)
  gh_gpu_program.uniform3f(shadertoy_prog_buf_a, "iResolution", winW, winH, 0.0)
  gh_gpu_program.uniform1f(shadertoy_prog_buf_a, "iTime", curtime)
  gh_gpu_program.uniform4f(shadertoy_prog_buf_a, "iMouse", mx, my, mz, mz)
  gh_gpu_program.uniform1i(shadertoy_prog_buf_a, "iFrame", curframe)

  gh_texture.rt_color_bind(buf_A, 0)
  gh_gpu_program.uniform1i(shadertoy_prog_buf_a, "iChannel0", 0)

  draw_quad(0, 0, winW, winH)

  gh_render_target.unbind(buf_A)

end

if ((do_animation == 1) and (buf_B > 0) and (shadertoy_prog_buf_b > 0)) then

  gh_render_target.bind(buf_B)
  --gh_renderer.clear_color_depth_buffers(0.0, 0.0, 0.0, 0.0, 1.0)

  gh_gpu_program.bind(shadertoy_prog_buf_b)
  gh_gpu_program.uniform3f(shadertoy_prog_buf_b, "iResolution", winW, winH, 0.0)
  gh_gpu_program.uniform1f(shadertoy_prog_buf_b, "iTime", curtime)
  gh_gpu_program.uniform4f(shadertoy_prog_buf_b, "iMouse", mx, my, mz, mz)
  gh_gpu_program.uniform1i(shadertoy_prog_buf_b, "iFrame", curframe)

  gh_texture.rt_color_bind(buf_B, 0)
  gh_gpu_program.uniform1i(shadertoy_prog_buf_b, "iChannel0", 0)

  draw_quad(0, 0, winW, winH)

  gh_render_target.unbind(buf_B)

end

if ((do_animation == 1) and (buf_C > 0) and (shadertoy_prog_buf_c > 0)) then

  gh_render_target.bind(buf_C)
  --gh_renderer.clear_color_depth_buffers(0.0, 0.0, 0.0, 0.0, 1.0)

  gh_gpu_program.bind(shadertoy_prog_buf_c)
  gh_gpu_program.uniform3f(shadertoy_prog_buf_c, "iResolution", winW, winH, 0.0)
  gh_gpu_program.uniform1f(shadertoy_prog_buf_c, "iTime", curtime)
  gh_gpu_program.uniform4f(shadertoy_prog_buf_c, "iMouse", mx, my, mz, mz)
  gh_gpu_program.uniform1i(shadertoy_prog_buf_c, "iFrame", curframe)

  gh_texture.rt_color_bind(buf_C, 0)
  gh_gpu_program.uniform1i(shadertoy_prog_buf_c, "iChannel0", 0)

  draw_quad(0, 0, winW, winH)

  gh_render_target.unbind(buf_C)

end

if ((do_animation == 1) and (buf_D > 0) and (shadertoy_prog_buf_d > 0)) then

  gh_render_target.bind(buf_D)
  --gh_renderer.clear_color_depth_buffers(0.0, 0.0, 0.0, 0.0, 1.0)

  gh_gpu_program.bind(shadertoy_prog_buf_d)
  gh_gpu_program.uniform3f(shadertoy_prog_buf_d, "iResolution", winW, winH, 0.0)
  gh_gpu_program.uniform1f(shadertoy_prog_buf_d, "iTime", curtime)
  gh_gpu_program.uniform4f(shadertoy_prog_buf_d, "iMouse", mx, my, mz, mz)
  gh_gpu_program.uniform1i(shadertoy_prog_buf_d, "iFrame", curframe)

  gh_texture.rt_color_bind(buf_D, 0)
  gh_gpu_program.uniform1i(shadertoy_prog_buf_d, "iChannel0", 0)

  draw_quad(0, 0, winW, winH)

  gh_render_target.unbind(buf_D)

end

if ((do_animation == 1) and (buf_E > 0) and (shadertoy_prog_buf_e > 0)) then

  gh_render_target.bind(buf_E)
  --gh_renderer.clear_color_depth_buffers(0.0, 0.0, 0.0, 0.0, 1.0)

  gh_gpu_program.bind(shadertoy_prog_buf_e)
  gh_gpu_program.uniform3f(shadertoy_prog_buf_e, "iResolution", winW, winH, 0.0)
  gh_gpu_program.uniform1f(shadertoy_prog_buf_e, "iTime", curtime)
  gh_gpu_program.uniform4f(shadertoy_prog_buf_e, "iMouse", mx, my, mz, mz)
  gh_gpu_program.uniform1i(shadertoy_prog_buf_e, "iFrame", curframe)

  gh_texture.rt_color_bind(buf_E, 0)
  gh_gpu_program.uniform1i(shadertoy_prog_buf_e, "iChannel0", 0)

  draw_quad(0, 0, winW, winH)

  gh_render_target.unbind(buf_E)

end

if ((do_animation == 1) and (buf_F > 0) and (shadertoy_prog_buf_f > 0)) then

  gh_render_target.bind(buf_F)
  --gh_renderer.clear_color_depth_buffers(0.0, 0.0, 0.0, 0.0, 1.0)

  gh_gpu_program.bind(shadertoy_prog_buf_f)
  gh_gpu_program.uniform3f(shadertoy_prog_buf_f, "iResolution", winW, winH, 0.0)
  gh_gpu_program.uniform1f(shadertoy_prog_buf_f, "iTime", curtime)
  gh_gpu_program.uniform4f(shadertoy_prog_buf_f, "iMouse", mx, my, mz, mz)
  gh_gpu_program.uniform1i(shadertoy_prog_buf_f, "iFrame", curframe)

  gh_texture.rt_color_bind(buf_F, 0)
  gh_gpu_program.uniform1i(shadertoy_prog_buf_f, "iChannel0", 0)

  draw_quad(0, 0, winW, winH)

  gh_render_target.unbind(buf_F)

end


if ((do_animation == 1) and (img > 0) and (shadertoy_prog_img > 0)) then

  gh_render_target.bind(img)
  --gh_renderer.clear_color_depth_buffers(0.0, 0.0, 0.0, 0.0, 1.0)

  gh_gpu_program.bind(shadertoy_prog_img)
  gh_gpu_program.uniform3f(shadertoy_prog_img, "iResolution", winW, winH, 0.0)
  gh_gpu_program.uniform1f(shadertoy_prog_img, "iTime", curtime)
  gh_gpu_program.uniform4f(shadertoy_prog_img, "iMouse", mx, my, mz, mz)
  --gh_gpu_program.uniform4f(shadertoy_prog_img, "iChannelResolution0", winW, winH, 0.0, 0.0)
  gh_gpu_program.uniform1i(shadertoy_prog_img, "iFrame", curframe)

  gh_texture.rt_color_bind(buf_A, 0)
  gh_texture.rt_color_bind(buf_B, 1)
  gh_texture.rt_color_bind(buf_C, 2)
  gh_texture.rt_color_bind(buf_D, 3)
  gh_texture.rt_color_bind(buf_E, 4)
  gh_texture.rt_color_bind(buf_F, 5)
  gh_gpu_program.uniform1i(shadertoy_prog_img, "iChannel0", 0)
  gh_gpu_program.uniform1i(shadertoy_prog_img, "iChannel1", 1)
  gh_gpu_program.uniform1i(shadertoy_prog_img, "iChannel2", 2)
  gh_gpu_program.uniform1i(shadertoy_prog_img, "iChannel3", 3)
  gh_gpu_program.uniform1i(shadertoy_prog_img, "iChannel4", 4)
  gh_gpu_program.uniform1i(shadertoy_prog_img, "iChannel5", 5)

  draw_quad(0, 0, winW, winH)

pi = 3.14159265358979323846264
info = math.floor(elapsed_time / pi % 12)
str = "phase: %d"
fx = 10
fy = 10
fn = 3;

-- eye = vec3();//*7.;
-- gh_utils.font_render(font, fx, fy+fn, .0, .0, .0, 1.0, string.format(str, info))
gh_utils.font_render(font, fx, fy+fn, .0, .0, .0, 1.0, string.format("x: %d, y: %d", mx, my))
gh_utils.font_render(font, fx, fy+fn+40, .0, .0, .0, 1.0, string.format("x: %f, y: %f, z: %f", math.cos(my)*math.cos(mx),math.sin(my),math.cos(my)*math.sin(mx)))
-- gh_renderer.set_blending_state(1)

  gh_render_target.unbind(img)

end


