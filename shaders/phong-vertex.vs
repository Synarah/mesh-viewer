#version 400

layout (location = 0) in vec3 vPos;
layout (location = 1) in vec3 vNormals;
layout (location = 2) in vec2 vTextureCoords;

struct Li{
   vec4 pos;
   vec3 la;
   vec3 ld;
   vec3 ls;
};

struct Mi{
   vec3 ka;
   vec3 kd;
   vec3 ks;
   float shine;
};

uniform mat3 NormalMatrix;
uniform mat4 ModelViewMatrix;
uniform mat4 MVP;
uniform bool HasUV;

uniform Li l;
uniform Mi m;

out vec3 lightIn;

void main(){
   vec3 norEye = normalize(NormalMatrix * vNormals);
   vec4 posEye = ModelViewMatrix * vec4(vPos, 1.0);

   vec3 s = normalize(vec3(l.pos - posEye));
   vec3 v = normalize(-posEye.xyz);
   vec3 r = reflect(-s, norEye);
   float sn = max(dot(s,norEye), 0.0);

   vec3 amb = l.la * m.ka;
   vec3 dif = l.ld * m.kd * sn;
   vec3 spec = vec3(0.0);
   if(sn > 0.0){
      spec = l.ls * m.ks * pow(max(dot(r,v), 0.0), m.shine);
   }

   lightIn = amb + dif + spec;

   gl_Position = MVP * vec4(vPos, 1.0);
}