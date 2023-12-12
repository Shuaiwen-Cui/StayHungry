-> [中文](/SKILLSETS/IOT/MQTT/mqtt-cn.md)

# MQTT

> What is MQTT?

MQTT is a lightweight publish-subscribe messaging protocol which probably makes it the most suitable for various IoT devices. It was designed by Andy Stanford-Clark (IBM) and Arlen Nipper in 1999 for connecting Oil Pipeline telemetry systems over satellite. Since then its usage has expanded to the entire IoT industry.

> Key Elements

- **Broker**: The MQTT server which receives all messages from the clients and then routes the messages to the appropriate destination clients. The broker is the central hub for all MQTT communication.
- **Publisher**: A client which is responsible for publishing messages to the broker.
- **Subscriber**: A client which is responsible for receiving messages from the broker.

# Broker Implementations

## Mosquitto
Mosquitto is an open-source message broker that implements the MQTT protocol. It is written in C by Roger Light, and is available as a free download for Windows and Linux and is an Eclipse project.

## Emqx
Emqx is an open-source message broker that implements the MQTT protocol. It is written in Erlang and is available as a free download for Windows and Linux and is an Eclipse project.

Note: I use the emqx broker for my projects.

# Clients Implementations (Publishers and Subscribers)

Theoretically, any MQTT client can publish messages to or subscribe to topics on a broker. However, in practice, there are a few popular MQTT client implementations that are widely used.

## Paho MQTT

> What is Paho MQTT?

Paho is an Eclipse Foundation project which provides an open-source client implementations of MQTT and MQTT-SN messaging protocols aimed at new, existing, and emerging applications for the Internet of Things (IoT).

github link:

[🔗 paho.mqtt.c](https://github.com/eclipse/paho.mqtt.c.git)

Note: I use the paho.mqtt.c library for my projects.

it works!

> How to use the library? Follow the link below! (CN version)

[🔗 Official guide](https://eclipse.dev/paho/index.php?page=clients/c/index.php)

I never succeed in Windows, but it works well in Linux.

[🔗 Blog](https://www.cnblogs.com/homejim/p/8146405.html)

