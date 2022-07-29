// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.16 <0.9.0;
contract Blockrecondata {
    uint256 index = 0;
    uint256 refIndex = 0;
    //BlocData count initialize
    uint256 cnt =0;
    //Loadtestcode
    string assetId;

    struct Assets{
        string asset_metadata; }
    mapping(string => Assets) assets;
    event AssetEvent(string _actionPerformed, string _assetId, string _assetMetadata, uint256 _timestamp);
    //end

    struct asset1 {
        string account;
        string isin;
        string tradeRef;
        string counterParty;
        string metadata;}
    struct asset2 {
        string fund;
        string secID;
        string ref;
        string broker;
        string metadata;}
     struct asset3 {
        string acct;
        string asstType;
        string ref;
        string metadata;}
    struct recon {
        string assetID;
        string reconID;
        string matchID;
        string matchStatus;
        string sourceName;
        string metadata;}
    struct refdata {
        string refName;
        string field1;
        string field2;
        string field3;
        string field4;
        string field5;
        string metadata;}
//BlocData struct
    struct blocdata {
        string assetId;
        string group;
        string source;
        string metadata;
        string metadatagc;}
    event addAsset1(string actPerformed, string asset1_id, string account, string isin, string tradeRef, string counterParty, string metadata, uint256 timestamp);
    event addAsset2(string actPerformed, string asset2_id, string fund, string secID, string ref, string broker, string metadata, uint256 timestamp);
    event addAsset3(string actPerformed, string asset3_id, string acct, string asstType, string ref, string metadata, uint256 timestamp);
    event addRecon(string actPerformed, string assetID, string reconID, string matchID, string matchStatus, string sourceName, string metadata, uint256 timestamp);
    event addRef(string actPerformed, string refName, string field1, string field2, string field3, string field4, string field5, string metadata, uint256 timestamp);

    mapping (string => asset1) src1;
    mapping (string => asset2) src2;
    mapping (string => asset3) src3;
    mapping (uint256 => recon) rec;
    mapping (uint256 => refdata) ref;

    //BlocData mapping & event
    event addblocRef(string actPerformed, string assetId, string group, string source, string metadata, string metadatagc, uint256 timestamp);
    mapping (uint256 => blocdata) blocref;

    function addSrc1(string memory _asset1_id, string memory _account, string memory _isin, string memory _tradeRef, string memory _counterParty, string memory _metadata) public{
        src1[_asset1_id].account=_account;
        src1[_asset1_id].isin=_isin;
        src1[_asset1_id].tradeRef=_tradeRef;
        src1[_asset1_id].counterParty=_counterParty;
        src1[_asset1_id].metadata=_metadata;
        emit addAsset1("Source1 added on Blockchain",_asset1_id,_account,_isin,_tradeRef,_counterParty,_metadata,block.timestamp);}
    function addSrc2(string memory _asset2_id, string memory _fund, string memory _secID, string memory _ref, string memory _broker, string memory _metadata) public{
        src2[_asset2_id].fund=_fund;
        src2[_asset2_id].secID=_secID;
        src2[_asset2_id].ref=_ref;
        src2[_asset2_id].broker=_broker;
        src2[_asset2_id].metadata=_metadata;
        emit addAsset2("Source2 added on Blockchain",_asset2_id,_fund,_secID,_ref,_broker,_metadata,block.timestamp);}
     function addSrc3(string memory _asset3_id, string memory _acct, string memory _asstType, string memory _ref, string memory _metadata) public{
        src3[_asset3_id].acct=_acct;
        src3[_asset3_id].asstType=_asstType;
        src3[_asset3_id].ref=_ref;
        src3[_asset3_id].metadata=_metadata;
        emit addAsset3("Source3 added on Blockchain",_asset3_id,_acct,_asstType,_ref,_metadata,block.timestamp);}
    function reconOutput(string memory _assetID, string memory _reconID, string memory _matchID, string memory _matchStatus, string memory _sourceName, string memory _metadata) public{
        rec[index].assetID=_assetID;
        rec[index].reconID=_reconID;
        rec[index].matchID=_matchID;
        rec[index].matchStatus=_matchStatus;
        rec[index].sourceName=_sourceName;
        rec[index].metadata=_metadata;
        ++index;
        emit addRecon("Reconciliation added on Blockchain",_assetID,_reconID,_matchID,_matchStatus,_sourceName,_metadata,block.timestamp);}
    function addRefdata(string memory _refName, string memory _field1, string memory _field2, string memory _field3, string memory _field4, string memory _field5, string memory _metadata) public{
        ref[refIndex].refName=_refName;
        ref[refIndex].field1=_field1;
        ref[refIndex].field2=_field2;
        ref[refIndex].field3=_field3;
        ref[refIndex].field4=_field4;
        ref[refIndex].field5=_field5;
        ref[refIndex].metadata=_metadata;
        ++refIndex;
        emit addRef("Reference data added on Blockchain", _refName,_field1,_field2,_field3,_field4,_field5,_metadata,block.timestamp); }
    //BlocData function added
    function addBlocRefdata(string memory _assetId, string memory _group, string memory _source, string memory _metadata, string memory _metadatagc) public{
        blocref[cnt].assetId=_assetId;
        blocref[cnt].group=_group;
        blocref[cnt].source=_source;
        blocref[cnt].metadata=_metadata;
        blocref[cnt].metadata=_metadatagc;
        ++cnt;
        emit addblocRef("Reference Bloc data added on Blockchain", _assetId,_group,_source,_metadata,_metadatagc,block.timestamp); }
    //Loadtest code
    function addAsset(string memory _assetId, string memory _assetMetadata) public{
        assets[_assetId].asset_metadata = _assetMetadata;
        emit AssetEvent("ASSET ADDED ON BLOCKCHAIN", _assetId, _assetMetadata, block.timestamp); }
    function getblocRef(uint256 _refId) public view returns(string memory, string memory){
        return(blocref[_refId].assetId, blocref[_refId].metadata); }
}
