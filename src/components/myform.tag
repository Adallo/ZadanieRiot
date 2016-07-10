<myform>
        <div class='myform'>
            <h2>Fill in the form bellow to add new tasks</h2>
            <form onsubmit ={add}>
                <p>Name</p>
                <input type='text' name='name' required='required'>
                <p>Description</p>
                <textarea  name='description' rows='5'></textarea>
                <p>Date From <span class='tips'>(yyyy-mm-dd)</span></p>
                <input type='text' name='dateFrom' required='required' pattern='^(19|20)\d\d([- \.])(0[1-9]|1[012])\2(0[1-9]|[12][0-9]|3[01])$'>
                <p>Date To <span class='tips'>(yyyy-mm-dd)</span></p>
                <input type='text' name='dateTo' required='required' pattern='^(19|20)\d\d([- \.])(0[1-9]|1[012])\2(0[1-9]|[12][0-9]|3[01])$'>
                <p></p>
                <input type='submit' value='Add' class='addButton'></submit>
            </form>
        </div>

  
  
  <script>
   
    this.add = (e) => {
        this.temp = {
                    name: e.target.name.value,
                    description: e.target.description.value,
                    dateFrom : e.target.dateFrom.value,
                    dateTo : e.target.dateTo.value
                    };
        riot.control.trigger(riot.EVT.addItem, this.temp); 
        e.target.reset();
    };
    
  </script>
</myform>
