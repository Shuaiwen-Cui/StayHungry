-> [English](/DEVENV/OS/os.md)

# 操作系统
**OS 重要分支演化史**

![OS Family Tree](https://external-preview.redd.it/qZ5k2xhPjTj8el_KMqBYxgPHyxrVeibqQ2Yrwy49NBM.png?auto=webp&s=f79618f627f8913fbbb490e0734f1a4491c0ba62)
- Source: [reddit/imgur.com](https://imgur.com/EpT5Pwf)

![OS Family Tree](https://raw.githubusercontent.com/EG-tech/digipres-posters/master/OS_kernel_timeline.jpg)
- Source: [EG-tech/digipres-posters](https://github.com/EG-tech/digipres-posters.git)

注意：这里只列出了最流行的操作系统。

## Windows
Windows 是微软开发的广泛使用的操作系统，以其用户友好的界面和与软件和硬件的广泛兼容性而闻名。最初于 1985 年推出，Windows 经过了多次迭代，最新版本是 Windows 11。它提供了图形用户界面、多任务处理能力以及对大量应用程序的支持，使其成为个人和企业计算的必备品。Windows 为用户提供了一个熟悉的环境，其中包括开始菜单、任务栏和一系列生产力工具，这有助于其在计算领域的广泛采用和持久存在。

## MacOS
macOS 是苹果公司为其 Macintosh 系列计算机开发的操作系统。最初于 1984 年作为系统软件发布，它经历了多次转变，现在基于名为 Darwin 的基于 Unix 的基础。以其流畅直观的用户界面而闻名，macOS 包含了 Dock、Finder 和 Spotlight 搜索等功能，为用户提供了视觉上吸引人且高效的计算体验。macOS 因其与其他 Apple 设备和服务的无缝集成而受到认可，并且以其稳定性、安全性和设计美学而闻名，使其成为创意专业人士和日常用户的流行选择。

## Linux
Linux 是一个开源的类 Unix 操作系统内核，最初由 Linus Torvalds 于 1991 年创建。Linux 的独特之处在于其去中心化的开发模式，由全球开发者社区做出贡献。虽然各种发行版 (distros) 将 Linux 内核与不同的软件组件打包在一起以创建完整的操作系统，但它们都共享相同的核心原则：定制、安全和稳定性。Linux 广泛用于服务器、嵌入式系统以及作为替代桌面操作系统。以其强大的性能、效率以及从众多桌面环境中进行选择的灵活性而闻名，Linux 因其多功能性和强调用户控制和自由而广受欢迎。

### Raspbian
Raspbian 是一个基于 Debian 的操作系统，专门为 Raspberry Pi 设计，Raspberry Pi 是一款由 Raspberry Pi 基金会开发的信用卡大小的单板计算机。作为 Raspberry Pi 的官方操作系统，Raspbian 针对 Pi 的硬件架构进行了优化，并附带了各种预安装的应用程序和工具。它为初学者和经验丰富的用户提供了一个用户友好的环境，非常适合教育目的、DIY 项目和各种物联网 (IoT) 应用程序。Raspbian 与 Raspberry Pi 硬件配件的广泛兼容性以及其积极的社区支持使其成为那些正在探索这种经济实惠且多功能计算平台可能性的人的流行选择。

### CentOS
CentOS 是 Community ENTerprise Operating System 的缩写，它是一个从 Red Hat Enterprise Linux (RHEL) 的免费可用源代码派生出来的 Linux 发行版。以其稳定性和可靠性而闻名，CentOS 是服务器和企业环境的流行选择。它继承了 RHEL 的许多功能和安全更新，同时是免费提供和开源的。CentOS 强调长期支持并专注于服务器级性能，使其成为企业和组织寻求用于其服务器基础设施的强大且可靠的 Linux 发行版的首选。

### Ubuntu
Ubuntu 基于 Debian，已成为最广泛使用和最用户友好的 Linux 发行版之一。由 Canonical Ltd. 开发，Ubuntu 旨在为桌面和服务器用户提供完整且可访问的计算体验。Ubuntu 强调易用性、定期发布带有长期支持选项以及通过其软件包管理系统提供的大量软件库，因此 Ubuntu 在初学者和经验丰富的用户中都很受欢迎。它的桌面环境、Unity（现已被 GNOME 取代）和 Ubuntu 软件中心有助于其用户友好的界面，使其成为从个人计算到服务器部署的广泛应用的理想选择。

## RTOS
实时操作系统 (RTOS) 是一种专门为需要精确和可预测的计时和响应性的嵌入式应用程序设计的软件系统。与通用操作系统不同，RTOS 会根据实时约束优先执行任务，确保关键任务在指定的截止日期内完成。RTOS 通常用于汽车系统、医疗设备、工业自动化和其他嵌入式系统等应用，其中计时、可靠性和确定性行为至关重要。它提供了任务调度、任务间通信的机制，并且通常包括支持实时要求的功能，使其成为开发人员在处理时间敏感应用程序时必不可少的工具。

### FreeRTOS
FreeRTOS 是 Real-Time Operating System 的缩写，它是一个开源的、实时内核，专为嵌入式系统和物联网 (IoT) 设备而设计。由 Richard Barry 开发，FreeRTOS 提供了一个小型、高效且高度可配置的实时操作系统，可以根据嵌入式应用程序的特定要求进行定制。作为一个实时操作系统，FreeRTOS 优先考虑确定性和可预测的行为，使其非常适合在计时和响应性至关重要的应用程序中使用。
FreeRTOS 以其可移植性和可扩展性而闻名，使其可以在各种微控制器体系结构上运行。它包括抢占式调度算法、任务管理、任务间通信机制以及对轻量级通信协议的支持。FreeRTOS 模块化的设计使开发人员可以选择并仅包含他们应用程序所需的组件，从而优化代码大小和执行效率。FreeRTOS 在汽车、航空航天和消费电子等行业广泛采用，继续成为寻求为资源受限的嵌入式系统提供强大且可定制的实时操作系统的开发人员的首选。

