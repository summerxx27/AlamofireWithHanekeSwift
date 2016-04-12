//
//  TableViewCell.swift
//  UsingLibsForSwfit
//
//  Created by zjwang on 16/3/21.
//  Copyright © 2016年 Zhangjingwang. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    var titleLabel = UILabel()
    var imagePic = UIImageView()
    var string = String()
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        
        super.init(style: UITableViewCellStyle.Default, reuseIdentifier: reuseIdentifier)
        self.createCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // createCell
    func createCell()
    {
        imagePic = UIImageView.init(frame: CGRectMake(0, 0, 350, 180))
        self.contentView.addSubview(imagePic)
        // 二次计算高度
        titleLabel = UILabel.init(frame: CGRectMake(0, 185, 350, 30))
        self.contentView.addSubview(titleLabel)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
