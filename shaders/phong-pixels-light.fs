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
uniform Li l2;
uniform Mi m;

in vec3 pos;
in vec3 nor;
out vec4 FragColor;

vec3 ads(){
   vec3 n = normalize(nor);
   vec3 s = normalize(vec3(l.pos.xyz) - pos);
   vec3 v = normalize(vec3(-pos));
   vec3 r = reflect(-s,n);

   return l.ls * (m.ka +
                 (m.kd * max(dot(s,n), 0.0))+
                 (m.ks * pow(max(dot(r,v),0.0), m.shine)));
}

vec3 ads2(){
   vec3 n = normalize(nor);
   vec3 s = normalize(vec3(l2.pos.xyz) - pos);
   vec3 v = normalize(vec3(-pos));
   vec3 r = reflect(-s,n);

   return l2.ls * (m.ka +
                  (m.kd * max(dot(s,n), 0.0))+
                  (m.ks * pow(max(dot(r,v),0.0), m.shine)));
}


void main(){
   FragColor = vec4(ads()+ads2(), 1.0);
}
