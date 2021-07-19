//
//  ContentView.swift
//  SwiftUI-List-Starter
//
//  Created by Sean Allen on 4/23/21.
//

import SwiftUI

struct VideoListView: View {
    
    var videos: [Video] = VideoList.topTen
    
    var body: some View {
    
        NavigationView {
            
            // 배열 형태로 뷰 만들기
            // 데이터 파싱 해주기
            List(videos, id: \.id){ video in
                
                NavigationLink (destination: VideoDetailView(video: video),label: {
                    
                    VideoCell(video: video)
                        
                    
                })
                
                
            }
            
            .navigationTitle("Sean's Top 10")
        }
        
        
        
    }
}


struct VideoCell: View {
    
    var video: Video
    
    var body: some View{
        
        HStack{
            Image(video.imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 70)
                .cornerRadius(4)
            // top,bottom에 간격 주기
                .padding(.vertical,5)
            
            VStack(alignment: .leading, spacing: 5) {
                
                Text(video.title)
                    .fontWeight(.semibold)
                // 너무 많은 글자가 있으면 보기 안 좋음을 방지
                    .lineLimit(2)
                // 텍스트가 너무 길다면 글자 크기 조정
                    .minimumScaleFactor(0.5)
                
                Text(video.uploadDate)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
            }
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView()
    }
}
