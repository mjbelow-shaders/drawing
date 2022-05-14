#version 330
out vec4 FragColor;
in vec4 v_texcoord;

uniform vec3 iResolution;
uniform float iTime;
uniform int iFrame;
uniform vec4 iMouse;

uniform sampler2D iChannel0;

float sdBox( in vec2 p, in vec2 b )
{
// return length(p) - b.x;
    vec2 d = abs(p)-b;
    return length(max(d,0.0)) + min(max(d.x,d.y),0.0);
}

void cubemap(vec3 r, out float texId, out vec2 st) {
   vec3 uvw;
   vec3 absr = abs(r);
   if (absr.x > absr.y && absr.x > absr.z) {
     // x major
     float negx = step(r.x, 0.0);
     uvw = vec3(r.zy, absr.x) * vec3(mix(-1.0, 1.0, negx), -1, 1);
     texId = negx;
   } else if (absr.y > absr.z) {
     // y major
     float negy = step(r.y, 0.0);
     uvw = vec3(r.xz, absr.y) * vec3(1.0, mix(1.0, -1.0, negy), 1.0);
     texId = 2.0 + negy;
   } else {
     // z major
     float negz = step(r.z, 0.0);
     uvw = vec3(r.xy, absr.z) * vec3(mix(1.0, -1.0, negz), -1, 1);
     texId = 4.0 + negz;
   }
   st = vec2(uvw.xy / uvw.z + 1.) * .5;
}

vec3 rayDirection(float fieldOfView, vec2 size, vec2 fragCoord) {
    vec2 xy = fragCoord - size / 2.0;
    float z = size.y / tan(radians(fieldOfView) / 2.0);
    return normalize(vec3(xy, -z));
}

mat3 viewMatrix(vec3 eye, vec3 center, vec3 up) {
    // Based on gluLookAt man page
    vec3 f = normalize(center - eye);
    vec3 s = normalize(cross(f, up));
    vec3 u = cross(s, f);
    return mat3(s, u, -f);
}

#define PI 3.14159

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    
    vec2 uv = fragCoord/iResolution.xy;
    //fragColor = texelFetch(iChannel0, ivec2(fragCoord), 0);
    fragColor = texture(iChannel0, uv);

    float r = fragColor.a;
    
    if(iFrame == 0)
    {
    fragColor = vec4(1);
    return;
    }
	
	// fragColor = vec4(.5);
	// return;
	
	vec3 viewDir = rayDirection(126.0, iResolution.xy, fragCoord);
	vec3 eye = vec3(8.0, 5.0 * sin(0.2 * iTime), 7.0);

    float mx=iMouse.x/iResolution.x*PI*2.0;
    float my=iMouse.y/iResolution.y*PI + PI/2.0;
	// mx = 3.141592653589;
	// my = 0.5;
	
	float mx_diff = 3.141592653589 - mx;
	float my_diff = 0. - my;
	
	mx += mx_diff;
	my += my_diff;
	
    eye = vec3(cos(my)*cos(mx),sin(my),cos(my)*sin(mx));//*7.;
	
	mat3 viewToWorld = viewMatrix(eye, vec3(0.0, 0.0, 0.0), vec3(0.0, 1.0, 0.0));
	
	vec3 worldDir = viewToWorld * viewDir;

	float texId;
	vec2 st;
	
	cubemap(worldDir, texId, st);
	
	// fragColor = vec4(st.x, st.y, 0, 1);
	
	int area = 0;
	
    float select = step(float(area) - 0.5, texId) * 
                   step(texId, float(area) + .5);

	//fragColor = vec4(0);
    //fragColor = vec4(0,pressure,0,0);
    
    //float dd = length(uv);
    //fragColor = vec4(dd);
    
    
    if (iMouse.z > 0.0 && select == 1.) {
        vec2 uv2 = (fragCoord - iMouse.xy) / iResolution.y;
        

        
        // float d = sdBox(uv2, vec2(.0));
        float d = length(uv2);
        
        // vec4 bg = vec4(0, .5, 1, 1);
        // vec4 fg = vec4(1) - bg;
        
        // r = min(r, step(0., d));
        // r = max(r, 1.-step(0., d));
        
        // vec4 fColor2 = vec4(r);
        
        // fragColor = mix(bg, fg, r);
        
        // fragColor.a = r;
		
		// if(d < 0.)
			// fragColor = vec4(1,1,1,1);
		fragColor = mix(fragColor, vec4(0,.5,1,1), smoothstep(.01,-.0, d));
    }
	
	// if(select == 1.)
		// fragColor = vec4(0, .5, 1, 1);
}

void main( void ){vec4 color = vec4(0.0,0.0,0.0,0.0);mainImage( color, gl_FragCoord.xy );FragColor = color;}
