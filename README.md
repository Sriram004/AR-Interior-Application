# AR-Interior-Application

An ARKit-powered interior design app that allows users to scan their rooms, place virtual furniture models, and visualize them in real-time with realistic lighting and occlusion. Built for **Flam iOS Assignment – Challenge 4**.

---

## 🛠 Features
- AR room scanning using **ARKit scene reconstruction**
- Real-time detection of horizontal planes (floors, tables)
- Tap-to-place functionality with accurate model anchoring
- Load and place `.usdz` furniture models
- Realistic rendering with light estimation
- Occlusion support using mesh classification
- Built using **SwiftUI + RealityKit + MVVM + Combine**

---

## 📁 Project Structure
```
ARInteriorApp/
├── App.swift
├── SceneDelegate.swift
├── Info.plist
├── Models/
│   └── FurnitureModel.swift
├── ViewModel/
│   └── ARRoomViewModel.swift
├── Views/
│   └── ARRoomView.swift
├── Services/
│   └── ARSessionManager.swift
├── Resources/
│   └── Models/
│       ├── chair.usdz
│       ├── table.usdz
│       └── etc.
└── README.md
```

---

## 🚀 How to Run
1. Open the project in **Xcode 14+**
2. Add `.usdz` files to `Resources/Models/` and ensure they're bundled
3. Run on a **real iOS device** (ARKit not supported on Simulator)
4. Tap anywhere on detected planes to place furniture

---

## ✅ Requirements
- iOS 15+
- Xcode 14+
- Swift 5.5+
- ARKit-compatible device (iPhone X or newer)

---

## 🙋 Author
**Sriram S**  
Flam iOS Assignment – Challenge 4 (ARKit Interior Design App)

> *This app demonstrates advanced ARKit features with 3D model placement and scene understanding.*
