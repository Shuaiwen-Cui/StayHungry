-> [English](/SKILLSETS/IOT/MQTT/mqtt.md)

# MQTT

> 什么是MQTT？

MQTT是一种轻量级的发布-订阅消息协议，可能使其成为各种物联网设备最合适的协议。它由Andy Stanford-Clark（IBM）和Arlen Nipper于1999年设计，用于连接通过卫星传输的油管测控系统。自那时以来，它的使用已经扩展到整个物联网行业。

> 关键元素

- **代理**：MQTT服务器，它接收来自客户端的所有消息，然后将消息路由到适当的目标客户端。代理是所有MQTT通信的中心枢纽。
- **发布者**：负责将消息发布到代理的客户端。
- **订阅者**：负责从代理接收消息的客户端。

# 代理实现

## Mosquitto
Mosquitto是一个实现MQTT协议的开源消息代理。它由Roger Light用C语言编写，并可免费下载供Windows和Linux使用，是一个Eclipse项目。

## Emqx
Emqx是一个实现MQTT协议的开源消息代理。它由Erlang语言编写，并可免费下载供Windows和Linux使用，是一个Eclipse项目。

注意：我在我的项目中使用emqx代理。


# 客户端实现 (发布者和订阅者)

理论上，任何MQTT客户端都可以向代理发布消息或订阅主题。但是，在实践中，有一些广泛使用的MQTT客户端实现。

## Paho MQTT

> 什么是Paho MQTT？

Paho是一个Eclipse基金会项目，提供了MQTT和MQTT-SN消息协议的开源客户端实现，旨在为物联网（IoT）的新应用、现有应用和新兴应用提供支持。

GitHub链接：

[🔗 paho.mqtt.c](https://github.com/eclipse/paho.mqtt.c.git)

注意：我在我的项目中使用paho.mqtt.c库。

> 如何使用这个库？可以参考下面的链接！（中文版）

[🔗 博客](https://www.cnblogs.com/homejim/p/8146405.html)

