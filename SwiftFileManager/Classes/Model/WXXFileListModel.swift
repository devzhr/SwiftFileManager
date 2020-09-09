//
//  FileListModel.swift
//  SwiftFileManager
//
//  Created by DevZHR on 2017/8/17.
//  Copyright © 2017 DevZHR. All rights reserved.
//

import UIKit

enum FileType: String {
    case none   = "large_unknown"
    case folder = "large_file"
    case zip    = "large_zip"
    case image  = "large_pic"
    case video  = "large_ai"
    case audio  = "large_music"
    case word   = "large_word"
    case excel  = "large_xls"
    case ppt    = "large_ppt"
    case pdf    = "large_pdf"
    case db     = "db"
    case txt    = "large_txt" 
    case html    = "large_doc" 
}

class WXXFileListModel: NSObject {
    var filePath: String = ""
    
    var fileName: String {
        if let name = (self.filePath as NSString?)?.lastPathComponent {
            return name
        }
        return ""
    }
    
    var fileExt: String {
        if let ext = (fileName as NSString?)?.pathExtension.lowercased() {
            return ext
        }
        return ""
    }
    
    var fileType: FileType {
        var isDir : ObjCBool = false
        if  FileManager.default.fileExists(atPath: self.filePath, isDirectory: &isDir) {
            if isDir.boolValue {
                return .folder
            }else{
                if fileExt == "zip" || fileExt == "rar" {
                    return .zip
                }
                if fileExt == "jpg" || fileExt == "png" || fileExt == "jpeg" || fileExt == "gif" {
                    return .image
                }
                if fileExt == "pdf" {
                    return .pdf
                }
                if fileExt == "ppt" || fileExt == "pptx"{
                    return .ppt
                }
                if fileExt == "doc" || fileExt == "docx" {
                    return .word
                }
                if fileExt == "xls" || fileExt == "xlsx" {
                    return .excel
                }
                if fileExt == "mp4" || fileExt == "mov" {
                    return .video
                }
                if fileExt == "mp3" || fileExt == "wav" || fileExt == "wma" || fileExt == "amr"{
                    return .audio
                }
                if fileExt == "txt" || fileExt == "rtf" || fileExt == "plist" {
                    return .txt
                }
                if fileExt == "html"{
                    return .html
                }
            }
        }
        return .none
    }
    
    var fileIcon: UIImage? {
        let imageName = fileType.rawValue
        return Bundle.getImage(imageName: imageName)
    }
    
}
