//--------------------------------------------------
// Author:
// Date:
// Description: Loads PLY files in ASCII format
//--------------------------------------------------

#include "plymesh.h"
#include <iostream>
#include <fstream>
#include <stdio.h>
#include <sstream>

using namespace std;
using namespace glm;

namespace agl {

   PLYMesh::PLYMesh(const std::string& filename) {
      load(filename);
   }

   PLYMesh::PLYMesh() {
   }

   void PLYMesh::init() {
      assert(_positions.size() != 0);
      initBuffers(&_faces, &_positions, &_normals);
   }

   PLYMesh::~PLYMesh() {
   }

   bool PLYMesh::load(const std::string& filename) {
      if (_positions.size() != 0) {
         std::cout << "WARNING: Cannot load different files with the same PLY mesh\n";
         return false;
      }
      // todo: your code here
      ifstream myFile;
      myFile.open(filename);

      if(!myFile.is_open()) {
         return false;
      }

      string info;
      myFile >> info;

      if(info.compare("ply") != 0) {
         return false;
      }

      while(info.compare("vertex") != 0) {
         myFile >> info;
      }

      myFile >> info;
      int numVer = stoi(info);

      while(info.compare("face") != 0) {
         myFile >> info;
      }
      myFile >> info;
      int numFace = stoi(info);

      while(info.compare("end_header") != 0) {
         myFile >> info;
      }

      for(int i = 0; i < numVer; i++) {
         GLfloat v1, v2, v3, v4, v5, v6;
         myFile >> v1;
         myFile >> v2;
         myFile >> v3;
         myFile >> v4;
         myFile >> v5;
         myFile >> v6;
         vec3 vtx = vec3(v1, v2, v3);

         _positions.push_back(v1);
         _positions.push_back(v2);
         _positions.push_back(v3);
         _normals.push_back(v4);
         _normals.push_back(v5);
         _normals.push_back(v6);

         myFile >> info;
         myFile >> info;
      }

      for(int i = 0; i < numFace; i++) {
         myFile >> info;
         GLuint  f1, f2, f3;
         myFile >> f1;
         myFile >> f2;
         myFile >> f3;
         _faces.push_back(f1);
         _faces.push_back(f2);
         _faces.push_back(f3);
         for(int j = 0; j < numFace - 3; j++){
            GLuint fi;
            myFile >> fi;
            _faces.push_back(f1 - 1);
            _faces.push_back(fi - 1);
            _faces.push_back(fi - 1); 
         }
      }

      if(numVer == 0 || numFace == 0){
         return false;
      }

      return false;
   }

   glm::vec3 PLYMesh::minBounds() const {
      glm::vec3 min(_positions[0], _positions[1], _positions[2]);

      for(int i = 0; i < _positions.size(); i += 3){
      glm::vec3 ver(_positions[i], _positions[i+1], _positions[i+2]);
          if(ver.x < min.x){
            min.x = ver.x;
         }
         if(ver.y < min.y){
            min.y = ver.y;
         }
         if(ver.z < min.z){
            min.z = ver.z;
         }
      }
      return min;
   }

   glm::vec3 PLYMesh::maxBounds() const {
      glm::vec3 max(_positions[0], _positions[1], _positions[2]);

       for (int i = 0; i < _positions.size(); i += 3){
         glm::vec3 ver(_positions[i], _positions[i+1], _positions[i+2]);
         if(ver.x > max.x){
            max.x = ver.x;
         }
         if(ver.y > max.y){
            max.y = ver.y;
         }
         if(ver.z > max.z){
            max.z = ver.z;
         }
       }
      return max;
   }

   int PLYMesh::numVertices() const {
      return _positions.size()/3;
   }

   int PLYMesh::numTriangles() const {
      return _faces.size()/3;
   }

   const std::vector<GLfloat>& PLYMesh::positions() const {
      return _positions;
   }

   const std::vector<GLfloat>& PLYMesh::normals() const {
      return _normals;
   }

   const std::vector<GLuint>& PLYMesh::indices() const {
      return _faces;
   }

   void PLYMesh::clear(){
      _positions.clear();
      _normals.clear();
      _faces.clear();
   }
}
