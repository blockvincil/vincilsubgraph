import { Bytes } from '@graphprotocol/graph-ts'
import { addAsset1, addAsset2, addAsset3, addRecon, addRef,AssetEvent,addblocRef} from '../generated/blockrecondata/blockrecondata'
import { source1,source2, source3, reconcile, refData,asset,blocrefHst,blocref} from '../generated/schema'

export function handleNewEventAddAsset1 (event: addAsset1): void {
  let asst1 = new source1 (event.params.timestamp.toHex())
  asst1.id = ((event.transaction.hash).toHexString())
  asst1.assetID = event.params.asset1_id
  asst1.account = event.params.account
  asst1.isin = event.params.isin
  asst1.traderef = event.params.tradeRef
  asst1.counterparty = event.params.counterParty
  asst1.metadata = event.params.metadata
  asst1.s1timestamp = event.block.timestamp
  asst1.save()
}
export function handleNewEventAddAsset2 (event: addAsset2): void {
  let asst2 = new source2 (event.params.timestamp.toHex())
  asst2.id = ((event.transaction.hash).toHexString())
  asst2.assetID = event.params.asset2_id
  asst2.fund = event.params.fund
  asst2.secid = event.params.secID
  asst2.ref = event.params.ref
  asst2.broker = event.params.broker
  asst2.metadata = event.params.metadata
  asst2.s2timestamp = event.block.timestamp
  asst2.save()
}

export function handleNewEventAddAsset3 (event: addAsset3): void {
  let asst3 = new source3 (event.params.timestamp.toHex())
  asst3.id = ((event.transaction.hash).toHexString())
  asst3.assetID = event.params.asset3_id
  asst3.acct = event.params.acct
  asst3.assttype = event.params.asstType
  asst3.ref = event.params.ref
  asst3.metadata = event.params.metadata
  asst3.s3timestamp = event.block.timestamp
  asst3.save()
}

export function handleNewEventRecon (event: addRecon): void {
  let rec = new reconcile (event.params.timestamp.toHex())
  rec.id = ((event.transaction.hash).toHexString())
  rec.assetid = event.params.assetID
  rec.reconid = event.params.reconID
  rec.matchid = event.params.matchID
  rec.matchstatus = event.params.matchStatus
  rec.sourcename = event.params.sourceName
  rec.metadata = event.params.metadata
  rec.rtimestamp = event.block.timestamp
  rec.save()
}

export function handleNewEventRef (event: addRef): void {
  let ref = new refData (event.params.timestamp.toHex())
  ref.id = ((event.transaction.hash).toHexString())
  ref.refname = event.params.refName
  ref.f1Name = event.params.field1
  ref.f2Name = event.params.field2
  ref.f3Name = event.params.field3
  ref.f4Name = event.params.field4
  ref.f5Name = event.params.field5
  ref.metadata = event.params.metadata
  ref.reftimestamp = event.block.timestamp
  ref.save()
}

export function handleNewEventAsst (event: AssetEvent): void {
  let asst = new asset (event.params._timestamp.toHex())
  asst.id = ((event.transaction.hash).toHexString())
  asst.asstId = event.params._assetId
  asst.asstmetadata = event.params._assetMetadata
  asst.assttimestamp = event.block.timestamp
  asst.save()
}

export function handleNewEventBlocRef (event: addblocRef): void {
  let bref = new blocrefHst (event.params.timestamp.toHex())
  bref.id = ((event.transaction.hash).toHexString())
  bref.assetId = event.params.assetId
  bref.grp = event.params.group
  bref.src = event.params.source
  bref.metadata = event.params.metadata
  bref.bloctimestamp = event.block.timestamp
  bref.save()
  let b1ref = new blocref (event.params.timestamp.toHex())
  b1ref.id = event.params.assetId
  b1ref.grp = event.params.group
  b1ref.src = event.params.source
  b1ref.metadatags = event.params.metadatagc
  b1ref.bloctimestamp = event.block.timestamp
  b1ref.save()
}