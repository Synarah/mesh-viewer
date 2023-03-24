#version 400

in vec3 lightIn;
in vec3 lightIn2;
out vec4 FragColor;

void main(){
   FragColor = vec4(lightIn + lightIn2, 1.0);
}