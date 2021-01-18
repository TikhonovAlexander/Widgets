//
//  WidgetsBundle.swift
//  LadderWidgetExtension
//
//  Created by Tikhonov, Aleksandr on 18.01.21.
//

import SwiftUI

@main
struct WidgetsBundle: WidgetBundle {
    @WidgetBundleBuilder
    var body: some Widget {
        LadderWidget()
        NewsWidget()
    }
}
