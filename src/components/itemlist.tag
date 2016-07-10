<itemlist>
    <div class='content'>
    <h2>Tasks added to list:</h2>
        <table>
            <tr each={items}>
                <td class='tdButton'><button onclick={remove}>X</button></td>
                <td> {this.name}</td>
                <td> {this.description}</td>
                <td> {this.dateFrom}</td>
                <td> {this.dateTo}</td>
            </tr>
        </table>
    </div>
    
    
    
  <script>
    this.items = [];
    
    this.on('mount', () => {
        riot.control.trigger(riot.EVT.loadItems);
    });

    riot.control.on(riot.EVT.loadItemsSuccess, items => {
        this.items = items;
        this.update()
    });
    
    this.remove = (e) => {
    
        var index = this.items.indexOf(e.item);

    /*
        this.anchor = e.target.parentNode.parentNode;
        this.index = findRow(this.anchor);
       
        function findRow(node){
            var i=0;
            
            while(node.previousSibling){
                node = node.previousSibling;
                
                if(node.nodeType === 1){
                    i++;
                }
        
            }
            return i;
        }
    */
    
        riot.control.trigger(riot.EVT.removeItem, index);
    }
    
  </script>
</itemlist>