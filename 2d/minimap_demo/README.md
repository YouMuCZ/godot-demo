# minimap demo


实现2D小地图的步骤如下：
- 创建一个单独的摄像机，将其放置在主摄像机上方，并设置为仅显示游戏世界的一部分。
- 创建一个新的Render Texture，用于渲染来自小地图摄像机的视图。
- 将Render Texture分配给一个新材质，并将其应用于一个UI元素，用于显示小地图。
- 设置小地图摄像机跟随玩家角色在游戏世界中移动。
- 使用图标或其他符号在小地图上表示游戏世界中的对象，并根据需要更新它们的位置。


原理：
The basic principle behind creating a 2D mini-map is to use a separate camera 
to capture a portion of the game world and render it onto a texture, 
which is then displayed on a UI element to create the mini-map.
