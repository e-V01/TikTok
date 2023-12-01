//
//  CurrentUserProfileView.swift
//  TikTok
//
//  Created by Y K on 01.12.2023.
//

import SwiftUI

struct CurrentUserProfileView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 2) {
                    // profile header
                    ProfileHeaderView()
                    // post grid view
                    PostGridView()
                }
                .padding(.top)

            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    CurrentUserProfileView()
}
