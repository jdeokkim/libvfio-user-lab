<!-- https://www.youtube.com/watch?v=TgjOrq39J94 -->

## PCI (Peripheral Component Interface)

PCI란 1990년대 초에 발표된, 메인 보드에 연결된 NIC, 사운드 카드, 하드 디스크 등의 주변 장치를 CPU에 연결하기 위한 버스 규격이다.  

PCI가 등장하기 전까지는 ISA (Industry Standard Architecture)와 VLB (VESA Local Bus)가 주로 사용되었으나, 컴퓨터의 성능이 향상되면서 기존 버스 규격의 낮은 대역폭, 전기적 불안정성과 메인보드 설계의 어려움 같은 문제점이 지적되었다.

PCI는 이러한 문제점을 모두 해결하며, 당시 컴퓨터의 주류 버스 규격으로 자리잡게 되었다.

<br>

## PCI-based Systems

<img src="./images/pci_based-v2.png" width="600"/>

2008년 이후부터는 Northbridge와 Southbridge 일부 기능이 CPU에 모두 들어있는 것이 일반적이지만, 예전에는 이러한 기능이 CPU가 아닌 메인보드 칩셋으로 구현되어 있었다.

PCI 기반의 시스템은 PCI 슬롯에 연결된 모든 주변 장치들의 버스가 하나로 묶여있는 '공유 버스' 형태로 구성되어 있기 때문에, 여러 개의 주변 장치가 동시에 CPU나 RAM한테 전기 신호를 보내는 '버스 경합 (bus contention)'이 발생할 경우 데이터 오염이나 하드웨어 손상을 야기할 수 있다. '버스 경합'을 막기 위해, Northbridge에서는 CPU와 PCI 장치 사이의 통신을 중재하는 하드웨어 회로를 두고 있는데, 이를 PCI Arbiter라고 한다.

PCI 장치는 하나 이상의 기능 (function)을 가질 수 있는데, '그래픽 연산'과 'HDMI 오디오'라는 두 가지 기능을 지원하는 NVIDIA 사의 그래픽 카드를 생각해보면 이해가 쉬울 것이다. CPU와 마찬가지로, 주변 장치의 각 기능은 PCI Arbiter에게 '공유 버스'를 사용하기 위한 권한을 요청 (`REQ#`)하고 PCI Arbiter가 이 요청을 받아들이면 (`GNT#`) '공유 버스'를 독점적으로 사용할 수 있는데, 이처럼 '공유 버스'의 사용 권한을 요청하는 CPU 또는 주변 장치를 Bus Master라고 한다.

<br>

## PCI Transaction Models

<br> 

## PCI Enumeration

<br>

## Configuration Space

<br>

## BAR (Base Address Register)

<br>

## IRQ-based Interrupts

<br>

## MSI-based Interrupts

<br>

## 참고 자료

- M. Jackson and R. Budruk, *PCI Express Technology: Comprehensive Guide to Generations 1.x, 2.x and 3.0*, 1st ed., MindShare, Inc., Sep. 2012.
- R. E. Bryant and D. R. O'Hallaron, *Computer Systems: A Programmer's Perspective*, 3rd ed., Pearson Education Ltd. 2016.