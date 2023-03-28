#version 400

layout (location = 0) in vec3 vPos;
layout (location = 1) in vec3 vNormals;
layout (location = 2) in vec2 vTextureCoords;



struct Li{
    vec4 pos;
    vec3 la;
    vec3 ld;
    vec3 ls;
    float exp;
    float co;
};

uniform mat3 NormalMatrix;
uniform mat4 ModelViewMatrix;
uniform mat4 MVP;
uniform bool HasUV;
uniform Li l3;

out vec3 pos;
out vec3 nor;
out vec3 sDir;


void main(){
   nor = normalize(NormalMatrix * vNormals);
   pos = vec3(ModelViewMatrix * vec4(vPos,1.0));
   sDir = normalize(-(vec3(l3.pos.xyz)));
   gl_Position = MVP * vec4(vPos, 1.0);
}