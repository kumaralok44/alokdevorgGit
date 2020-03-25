trigger UpdateDescriptionField on Account (before insert) {
    for (Account a : Trigger.New){
    a.Description=('New Description test');}
        System.debug('Description Updated!');
}