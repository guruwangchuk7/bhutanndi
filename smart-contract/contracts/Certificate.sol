// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Certificate {
    struct Cert {
        string cid;
        string studentName;
        string degree;
        string ipfsHash;
    }

    mapping(string => Cert) public certificates;

    event CertificateAdded(string cid, string ipfsHash);

    function addCertificate(
        string memory _cid,
        string memory _studentName,
        string memory _degree,
        string memory _ipfsHash
    ) public {
        certificates[_cid] = Cert(_cid, _studentName, _degree, _ipfsHash);
        emit CertificateAdded(_cid, _ipfsHash);
    }

    function verifyCertificate(string memory _cid, string memory _ipfsHash) public view returns (bool) {
        Cert memory c = certificates[_cid];
        if (bytes(c.ipfsHash).length == 0) return false;
        return keccak256(abi.encodePacked(c.ipfsHash)) == keccak256(abi.encodePacked(_ipfsHash));
    }
}
