#version 400

in vec3 lightIn;
out vec4 FragColor;

void main(){
   FragColor = vec4(lightIn, 1.0);
}