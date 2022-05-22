#version 330
out vec4 FragColor;
in vec4 v_texcoord;

uniform vec3 iResolution;
uniform float iTime;
uniform int iFrame;
uniform vec4 iMouse;

uniform sampler2D iChannel0;
uniform sampler2D iChannel1;
uniform sampler2D iChannel2;
uniform sampler2D iChannel3;
uniform sampler2D iChannel4;
uniform sampler2D iChannel5;

void cubemap(vec3 r, out float texId, out vec2 st, mat3 viewToWorld, vec3 viewDir) {
   vec3 uvw;
   // r = viewToWorld * viewDir;
   // r = inverse(viewToWorld) * r;
   
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
   //st = vec2(uvw.x / uvw.z, uvw.y / uvw.z);
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


#define PI 3.141592653589

float det(mat2 matrix) {
    return matrix[0].x * matrix[1].y - matrix[0].y * matrix[1].x;
}

mat2 inv(mat2 matrix) {
    
    float det = det(matrix);
    
    return mat2(
    matrix[1].y, -matrix[0].y,
    -matrix[1].x, matrix[0].x
    ) / det;
}

bool inArea(int area, float texId)
{
	return (step(float(area) - 0.5, texId) * step(texId, float(area) + .5)) == 1.;
}

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
	// vec2 iResolution = vec2(1280, 720);
    // Normalized pixel coordinates (from 0 to 1)
    vec2 uv = fragCoord/iResolution.xy;

    fragColor = texture(iChannel0, uv);
	fragColor = step(1., fragColor);
	//fragColor = vec4(1);
	
	vec3 viewDir = rayDirection(126, iResolution.xy, fragCoord);
	vec3 eye = vec3(8.0, 5.0 * sin(0.2 * iTime), 7.0);

    float mx=iMouse.x/iResolution.x*PI*2.0;
    float my=iMouse.y/iResolution.y*PI + PI/2.0;
	// mx = 3.14159;
	// my = 0.5;
	
	// mx = 3.14159;
	// my = .45;
    // mx=iMouse.x/iResolution.x*PI*2.0;
    // my= PI/2.0;
	
	// mx = 1.5707963267948966192;
	// my = 0.5;
	
    eye = vec3(cos(my)*cos(mx),sin(my),cos(my)*sin(mx));//*7.;
	
	// eye = vec3(-1, 0, 0);//0
	// eye = vec3(1, 0, 0);//1
	
	// eye = vec3(0.001, -1, 0);//2
	// eye = vec3(0.001, -1, 0.001);//2
	// eye = vec3(0.001, 1, 0);//3
	
	// eye = vec3(0, 0, -1);//4
	// eye = vec3(0, 0, 1);//5
	
	vec3 center = vec3(0.0, 0.0, 0.0);
	vec3 up = vec3(0.0, 1.0, 0.0);
	
    vec3 f = normalize(center - eye);
    vec3 s = normalize(cross(f, up));
    vec3 u = cross(s, f);
	
	
	mat3 viewToWorld = mat3(s, u, -f);
	
	vec3 worldDir = (viewToWorld) * viewDir;
	
	float texId;
	vec2 st;
	
	cubemap(worldDir, texId, st, viewToWorld, viewDir);
	
	// fragColor = vec4(st.x, st.y, 0, 1);
	
	int area = 0;
	
	vec3 coord = vec3(338, 143, 1);
	// coord.x = 0;
	coord.y = 0;
	
	vec3 absr = abs(worldDir);
	if (absr.x > absr.y && absr.x > absr.z) {
	// texId = step(worldDir.x, 0);
	}
	else
	{
		// texId = 1.;
	}
	
	
	
    float select = step(float(area) - 0.5, texId) * 
                   step(texId, float(area) + .5);
				   
	if (inArea(0, texId))
	{
		fragColor = texture(iChannel0, st);
		fragColor = 1. - fragColor;
	}
	if (inArea(1, texId))
	{
		fragColor = texture(iChannel1, st);
		fragColor = 1. - fragColor;
	}
	if (inArea(2, texId))
	{
		fragColor = texture(iChannel2, st);	
		fragColor = 1. - fragColor;
	}
	if (inArea(3, texId))
	{
		fragColor = texture(iChannel3, st);	
		fragColor = 1. - fragColor;
	}
	if (inArea(4, texId))
	{
		fragColor = texture(iChannel4, st);	
		fragColor = 1. - fragColor;
	}
	if (inArea(5, texId))
	{
		fragColor = texture(iChannel5, st);	
		fragColor = 1. - fragColor;
	}
	
	
	mat2 mm = mat2(
	1, uv.x,
	0, 1
	);
	
	// uv = mm * uv;
	mat2 idk = mat2(viewToWorld[0].x, viewToWorld[0].y, viewToWorld[1].x, viewToWorld[1].y);
	
	// uv = uv * inverse(idk);
	
	mat2 tr = mat2(
	40.0, 0,
	0.0, 40.);
	
	uv *= tr;
	uv = fragCoord/iResolution.xy;
	// fragColor *= texture(iChannel0, uv);
	
	// 370, 255
	
	vec2 uv2 = (fragCoord - vec2(370, 255)) / iResolution.yy;  //.5
	float dd = length(uv2);

	
	float pos = length((fragCoord - iMouse.xy) / iResolution.y);
	fragColor = mix(fragColor, 1.-fragColor, step(.05, pos));
	fragColor = mix(fragColor, 1.-fragColor, step(.1, pos));
}

void main( void ){vec4 color = vec4(0.0,0.0,0.0,0.0);mainImage( color, gl_FragCoord.xy );FragColor = color;}
