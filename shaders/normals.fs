#version 400

in vec3 nor;

out vec4 FragColor;
void main()
{
   FragColor = vec4(nor, 1.0);
}
