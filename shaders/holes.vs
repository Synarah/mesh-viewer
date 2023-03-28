#version 400
layout (location = 0) in vec3 VertexPosition;
layout (location = 1) in vec3 VertexNormal;
layout (location = 2) in vec2 VertexTexCoord;

out vec3 FrontColor;
out vec3 BackColor;
out vec2 TexCoord;

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

uniform mat4 ModelViewMatrix;
uniform mat3 NormalMatrix;
uniform mat4 ProjectionMatrix;
uniform mat4 MVP;

uniform Li l;
uniform Mi m;

void getEyeSpace(out vec3 nor, out vec4 pos){
    nor = normalize( NormalMatrix * VertexNormal);
    pos = ModelViewMatrix * vec4(VertexPosition,1.0);
}

vec3 pm(vec4 posEye, vec3 norEye){
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

   return amb + dif + spec;
}

void main(){
    vec3 norEye;
    vec4 posEye;
    TexCoord = VertexPosition.xy;

    getEyeSpace(norEye, posEye);
    FrontColor = pm(posEye, norEye);
    BackColor = pm(posEye, -norEye);

    gl_Position = MVP * vec4(VertexPosition,1.0);
}