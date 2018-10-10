//
//  Shaders.metal
//  Pipeline
//
//  Created by 陈吉 on 2018/10/10.
//  Copyright © 2018年 陈吉. All rights reserved.
//

#include <metal_stdlib>
using namespace metal;

//创建一个结构体VertexIn来描述顶点属性，以匹配先前创建的顶点描述符。在本例中，只有一个position。
struct VertexIn {
    float4 position [[ attribute(0) ]];
};

//实现一个顶点着色器，vertex_main，它接收VertexIn结构体，并以float4格式返回顶点位置。
//vertex float4 vertex_main(const VertexIn vertexIn [[ stage_in ]]) {
//    return vertexIn.position;
//}
vertex float4 vertex_main(const VertexIn vertexIn [[ stage_in ]], constant float &timer [[ buffer(1) ]]) {
    float4 position = vertexIn.position;
    position.y += timer;
    return position;
}

fragment float4 fragment_main() {
    return float4(1, 0, 0, 1);
}


