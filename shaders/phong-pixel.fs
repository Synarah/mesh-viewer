#version 400

out vec4 FragColor;

in vec3 norEye;
in vec3 posEye;

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
};

uniform Li l;
uniform Mi m;

void main(){
   vec3 n = normlize(norEye);
   vec3 v = normlize(vec3(-posEye));
   vec3 s = normlize(vec3(l.pos) - posEye);
   vec3 r = reflect(-s, n);
   float sn = max(dot(s,n), 0.0);

   vec3 amb = l.la * m.ka;
   vec3 dif = l.ld * m.kd * sn;
   vec3 spec = vec3(0.0);

   if(sn > 0.0f){
      spec = l.ls * m.ks * pow(dot(r,v), 3.0);
   }

   vec3 lin = amb + dif + spec;

   FragColor = vec4(lin, 1.0);
}
