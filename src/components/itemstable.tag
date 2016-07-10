<itemstable>
    <div class='content'>
    <table id='mytable'>
        <thead>
            <tr>
                <th  onclick={sortName}><a href="#" style="color: {this.fontColor(0)}">Name</a> <br>{this.direction(0)}</th>
                <th>Description</th>
                <th onclick={sortDateFrom}><a href="#" style="color: {this.fontColor(1)}" >Date From</a>
                <br>{this.direction(1)}</th>
                <th onclick={sortDateTo}><a href="#" style="color: {this.fontColor(2)}">Date To</a> <br>{this.direction(2)}</th>
            <tr>
        </thead>
        <tbody>
            <tr each={items}>
                <td> {this.name}</td>
                <td> {this.description}</td>
                <td class='tdDate'> {this.dateFrom}</td>
                <td class='tdDate'> {this.dateTo}</td>
            </tr>
        </tbody>
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
    
    this.fontColor = (index) => {
        if (this.isSorted[index]) {
            return 'red';
        } else {
            return 'blue';
        }   
    }
    
    this.direction = (index) => {
        if (this.isSorted[index]) {
            if (this.asc == true) {
                return '<down>';
            } else {
                return '<up>';
            }
        } else {
            return '';
        }
        
    }
    
    this.isSorted = [false, false ,false];
    this.asc = false;
    
    this.sortName = () => {
        if(!this.isSorted[0]) {
            this.items.sort(function(a,b) {
                return (a.name > b.name) ? 1 : ((b.name > a.name) ? -1 : 0 );
            });
            this.isSorted = [true, false ,false];
            this.asc = true;
        } else {
            this.items.reverse();
            this.asc = !this.asc;
        }
    }
    
    this.sortDateFrom = () => {
        if(!this.isSorted[1]) {
        this.items.sort( function(a, b) {
            let dateA = new Date(a.dateFrom).getTime();
            let dateB = new Date(b.dateFrom).getTime();
            return dateA - dateB;
        });
        this.isSorted = [false, true ,false];
        this.asc = true;
        } else {
            this.items.reverse();
            this.asc = !this.asc;
        }
    }
   
    this.sortDateTo = () => {
        if(!this.isSorted[2]) {
        this.items.sort( function(a, b) {
            let dateA = new Date(a.dateTo).getTime();
            let dateB = new Date(b.dateTo).getTime();
            return dateA - dateB;
        });
        this.isSorted = [false, false ,true];
        this.asc = true;
        } else {
            this.items.reverse();
            this.asc = !this.asc;
        }
    }    
    
</itemstable>