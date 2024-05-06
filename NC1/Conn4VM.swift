//
//  Conn4VM.swift
//  Connect4
//
//  Created by Aqilla Shahbani Mahazoya on 05/05/24.
//

import Foundation
import MultipeerConnectivity

class Conn4VM: NSObject, ObservableObject {
    
    var peerId: MCPeerID
    var session: MCSession
    var nearbyServiceAdvertiser: MCNearbyServiceAdvertiser?
    
    override init()
    {
        peerId = MCPeerID(displayName: UIDevice.current.name)
        session = MCSession(peer: peerId, securityIdentity: nil, encryptionPreference: .required)
        super.init()
        session.delegate = self
    }
    
    func advertise() {
        nearbyServiceAdvertiser = MCNearbyServiceAdvertiser(peer: peerId, discoveryInfo: nil, serviceType: "gt-conn4")
        nearbyServiceAdvertiser?.delegate = self
        nearbyServiceAdvertiser?.startAdvertisingPeer()
    }
    
    func invite() {
        let browser = MCBrowserViewController(serviceType: "gt-conn4", session: session)
        browser.delegate = self
        UIApplication.shared.windows.first?.rootViewController?.present(browser, animated: true)
    }
}

extension Conn4VM: MCSessionDelegate {
    func session(_ session: MCSession, peer peerID: MCPeerID, didChange state: MCSessionState) {
        switch state {
        case .connecting:
            print ("\(peerID) state: connecting")
        case .connected:
            print ("\(peerID) state: connected")
        case .notConnected:
            print ("\(peerID) state: notConnected")
        @unknown default:
            print ("\(peerID) state: unknown")
        }
    }
    
    func session(_ session: MCSession, didReceive data: Data, fromPeer peerID: MCPeerID)
    {
        
    }
    
    func session(_ session: MCSession, didReceive stream: InputStream, withName streamName: String, fromPeer peerID: MCPeerID) {
        
    }
    
    func session(_ session: MCSession, didStartReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, with progress: Progress) {
        
    }
    
    func session(_ session: MCSession, didFinishReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, at localURL: URL?, withError error: Error?) {
        
    }
}

extension Conn4VM: MCNearbyServiceAdvertiserDelegate {
    func advertiser(_ advertiser: MCNearbyServiceAdvertiser, didReceiveInvitationFromPeer peerID: MCPeerID, withContext context: Data?, invitationHandler: @escaping (Bool, MCSession?) -> Void) {
        invitationHandler(true, session)
    }
}

extension Conn4VM: MCBrowserViewControllerDelegate
{
    func browserViewControllerDidFinish(_ browserViewController: MCBrowserViewController) {
        browserViewController.dismiss(animated: true)
    }
    
    func browserViewControllerWasCancelled(_ browserViewController: MCBrowserViewController) {
        browserViewController.dismiss(animated: true)
    }
}


extension Conn4VM {
    func sendData(data: Data) {
        do {
            try session.send(data, toPeers: session.connectedPeers, with: .reliable)
        } catch {
            print("Failed to send data: \(error.localizedDescription)")
        }
    }
}
