#version 400

struct Li{
    vec4 pos;
    vec3 la;
    vec3 ld;
    vec3 ls;
    float exp;
    float co;
};

struct Mi{
   vec3 ka;
   vec3 kd;
   vec3 ks;
   float shine;
};

uniform Li l3;
uniform Mi m;

in vec3 pos;
in vec3 nor;
in vec3 sDir;
out vec4 FragColor;

vec3 ads(){
   vec3 s = normalize(vec3(l3.pos.xyz) - pos);
   float angle = acos(dot(-s, sDir));
   float co = radians(clamp(l3.co, 0.0, 90.0));
   vec3 amb = l3.la * m.ka;

   if(angle < co){
       float sf = pow(dot(-s, sDir),l3.exp);
       vec3 v = normalize(vec3(-pos));
       vec3 h = normalize(v+s);
       return amb + (sf * l3.la * (m.kd * max(dot(s,nor),0.0))+
                (m.ks * pow(max(dot(h,nor),0.0),m.shine)));
   }
   else{
      return amb; 
   }    
}

void main(){
   FragColor = vec4(ads(), 1.0);
}
