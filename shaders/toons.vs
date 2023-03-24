#version 400

layout (location = 0) in vec3 vPos;
layout (location = 1) in vec3 vNormals;
layout (location = 2) in vec2 vTextureCoords;

uniform mat3 NormalMatrix;
uniform mat4 ModelViewMatrix;
uniform mat4 MVP;
uniform bool HasUV;

out vec3 pos;
out vec3 nor;

void main(){
   nor = normalize(NormalMatrix * vNormals);
   pos = vec3(ModelViewMatrix * vec4(vPos,1.0));
   gl_Position = MVP * vec4(vPos, 1.0);
}