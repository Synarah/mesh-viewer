#version 400

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

uniform Li l;
uniform Mi m;

in vec3 pos;
in vec3 nor;
out vec4 FragColor;

const int lev = 3;
const float sf = 1.0;

vec3 ads(){
   vec3 s = normalize(vec3(l.pos.xyz) - pos);
   float cos = max(0.0, dot(s, nor));
   vec3 dif = m.kd * floor(cos * lev) * sf;
   
   return l.la * (m.ka + dif);
}

void main(){
   FragColor = vec4(ads(), 1.0);
}
