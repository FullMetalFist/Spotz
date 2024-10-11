//
//  CircleImage.swift
//  Spotz
//
//  Created by Michael Vilabrera on 9/30/24.
//

import SwiftUI

struct CircleImage: View {
    var image: Image
    
    var body: some View {
        image
            .frame(width: 200, height: 200)
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.white, lineWidth: 4)
            }
            .shadow(radius: 7)
    }
}

#Preview {
    CircleImage(image: Image("3rdAvePlaygroundFrancisLewis"))
}
