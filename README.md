<h1 align="center">RAYTRACING</h1>
<p align="center">How can raytracing be perfectly accurate in Minecraft?</p>

# 개요

광선 추적 또는 레이 트레이싱(ray tracing)은 가상적인 광선이 물체의 표면에서 반사되어, 카메라를 거쳐 다시 돌아오는 경로를 계산하는 것이다. 보통의 경우 그래픽 작업에서 많이 사용되어 반사된 경로까지 계산해야 하지만, 현재로써는 블럭과의 충돌만을 계산하기 위함을 목표로 한다.

# 방법

가장 간단하고 대표적인 방법으로는 특정 방향으로 Entity(대체로 Marker)를 보내 일정 간격마다 블럭과 충돌했는지 감지하는 방법이 있다. 