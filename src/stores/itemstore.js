class ItemStore{

  constructor(){
    riot.observable(this);
    this.items = [];

    this.bindEvents();
  }

  bindEvents(){
      
    this.on(riot.EVT.loadItems, () => {
       this.trigger(riot.EVT.loadItemsSuccess, this.items);
    });

    this.on(riot.EVT.addItem, (temp) => {
        this.items.unshift(temp);
        this.trigger(riot.EVT.loadItems);
    });
    
      this.on(riot.EVT.removeItem, (temps) => {
          this.items.splice(temps, 1);
          this.trigger(riot.EVT.loadItems);
          
      });
      
  }
}

let itemStore = new ItemStore();
riot.control.addStore(itemStore);

export default itemStore;