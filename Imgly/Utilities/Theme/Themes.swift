//
//  Themes.swift
//  Imgly
//
//  Created by Hayk Hayrapetyan on 22.12.23.
//

struct BlueTheme: Theme {
    let type: ThemeType = .blue
    let primaryColor = Colors.primaryBlue
    let secondaryColor = Colors.secondaryTurquoise
}

struct CoralTheme: Theme {
    let type: ThemeType = .coral
    let primaryColor = Colors.primaryCoral
    let secondaryColor = Colors.secondaryBlue
}

struct BrownTheme: Theme {
    let type: ThemeType = .brown
    let primaryColor = Colors.primaryBrown
    let secondaryColor = Colors.secondaryStoneBlue
}

struct PurpleTheme: Theme {
    let type: ThemeType = .purple
    let primaryColor = Colors.primaryPurple
    let secondaryColor = Colors.secondaryPink
}
