<script>
    let ugedage = ['Man', 'Tir', 'Ons', 'Tor', 'Fre', 'Lør', 'Søn'];
    let tider = ['Morgen', 'Formiddag', 'Eftermiddag', 'Aften'];
    let plan = {};
  
    // Initialiser plan objektet med tomme strenge for hver tid på hver dag
    tider.forEach(tid => {
      ugedage.forEach(dag => {
        if (!plan[tid]) plan[tid] = {};
        plan[tid][dag] = "";
      });
    });
  
    function updatePlan(tid, dag, event) {
      plan[tid][dag] = event.target.value;
    }
  </script>
  
  <style>
    .container{
      display: flex;
      align-items: flex-start;
    }
  
    .todo {
      flex: 3;
    }
  
    .logo {
      flex: 1;
    }
  
    table {
      width: 100%;
      border-collapse: collapse;
    }
  
    th, td {
      border: 1px solid black;
      padding: 10px;
      text-align: center;
    }
  
    th {
      background-color: #bbdefb;
      height: 50px;
    }
  
    tr {
      background-color: #bbdefb;
      height: 120px;
    }
  
    .logo img {
      width: 85%;
    }
  
    input[type='text'] {
      width: 90%; 
      height: 100%;
      background-color: white; 
      padding: 5px; 
      overflow: auto;
    }
  
    .todolist {
        margin-top: 150px;
        float: left;   
        margin-left: 20px; 
        text-align: center;

        
}

.todoitem img {
    margin-right: 10px;
    width: 50px; 
    height: 50px;
  }
  
  </style>
  
  <main class="container">
  
    <div class="logo">
      <img src="/logo.png" alt="Logo">
    </div>

    <div class="todolist">
        <h3>To do:</h3>
        <div class="todoitem">
        <div class="støvsuger">
            <img src = "/Støvsuger.jpeg" alt="Støvsuger">
            <label for = "stovsuge">Støvsuge</label>
        </div>
        <div class="vasketøj">
            <img src = "/vasketøj.jpeg" alt="Vasketøj">
            <label for = "vasktoj">Vasketøj</label>
        </div>
            
         
        </div>
       
    </div>

  
    <div class="todo">
      <table>
        <tr>
          <th>Uge:</th>
          {#each ugedage as dag}
            <th>{dag}</th>
          {/each}
        </tr>
        {#each tider as tid}
          <tr>
            <td>{tid}</td>
            {#each ugedage as dag}
              <td>
                <input type="text" bind:value={plan[tid][dag]} on:input={(event) => updatePlan(tid, dag, event)}>
              </td>
            {/each}
          </tr>
        {/each}
      </table>
    </div>
  
    <!-- Her kan du indsætte din yderligere todo list kode -->
  </main>