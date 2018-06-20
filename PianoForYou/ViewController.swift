//
//  ViewController.swift
//  PianoForYou
//
//  Created by Jon Holmberg on 11/06/2018.
//  Copyright © 2018 Bent. All rights reserved.
//

import UIKit

enum Note: String {
    case A
    case Bb
    case B
    case C
    case Db
    case D
    case Eb
    case E
    case F
    case Gb
    case G
    case Ab
}

class PianoKey {
    
    enum KeyType {
        case black
        case white
    }
    
    let type: KeyType
    let note: Note
    
    init(type: KeyType, note: Note) {
        self.type = type
        self.note = note
    }
}

class Row {
    var keys: [PianoKey]
    
    init() {
        keys = []
    }
}

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var keyCollectionView: UICollectionView!
    private let cellIdentifier = "KeyCollectionViewCell"
    
    var rows: [Row] = []
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return rows[section].keys.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return rows.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        let totalCellWidth = 30 * rows[section].keys.count // cell width = 30
        let totalSpacingWidth = 10 * (rows[section].keys.count - 1) // cell spacing = 10
        
        let inset = (collectionView.layer.frame.size.width - CGFloat(totalCellWidth + totalSpacingWidth)) / 2
        return UIEdgeInsets(top: 10, left: inset, bottom: 0, right: inset)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? KeyCollectionViewCell else {
            fatalError()
        }
        
        let pianoKey = rows[indexPath.section].keys[indexPath.row]
        
        cell.text = pianoKey.note.rawValue
        
        switch pianoKey.type {
        case .black:
            cell.backgroundColor = UIColor.black
            cell.textLabel.textColor = UIColor.white
        case .white:
            cell.backgroundColor = UIColor.white
            cell.layer.borderWidth = 1
            cell.layer.borderColor = UIColor.black.cgColor
        }
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let blackRow: Row = Row()
        blackRow.keys.append(PianoKey(type: .black, note: .Db))
        blackRow.keys.append(PianoKey(type: .black, note: .Eb))
        blackRow.keys.append(PianoKey(type: .black, note: .Gb))
        blackRow.keys.append(PianoKey(type: .black, note: .Ab))
        blackRow.keys.append(PianoKey(type: .black, note: .Bb))
        rows.append(blackRow)
        
        let whiteRow: Row = Row()
        whiteRow.keys.append(PianoKey(type: .white, note: .C))
        whiteRow.keys.append(PianoKey(type: .white, note: .D))
        whiteRow.keys.append(PianoKey(type: .white, note: .E))
        whiteRow.keys.append(PianoKey(type: .white, note: .F))
        whiteRow.keys.append(PianoKey(type: .white, note: .G))
        whiteRow.keys.append(PianoKey(type: .white, note: .A))
        whiteRow.keys.append(PianoKey(type: .white, note: .B))
        rows.append(whiteRow)
        
        keyCollectionView.delegate = self
        keyCollectionView.dataSource = self
        
        keyCollectionView.reloadData()
    }


}

