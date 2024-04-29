<script>
    import {goto} from '$app/navigation';
    let ugedage = ['Man', 'Tir', 'Ons', 'Tor', 'Fre', 'Lør', 'Søn'];
    let tider = ['Morgen', 'Formiddag', 'Eftermiddag', 'Aften'];
    let plan = {};
  
    tider.forEach(tid => {
      ugedage.forEach(dag => {
        if (!plan[tid]) plan[tid] = {};
        plan[tid][dag] = "";
      });
    });
  
    function updatePlan(tid, dag, event) {
      plan[tid][dag] = event.target.value;
    }

    function navigationTostart() {
        goto('/api/start');}

        const logout = async () => {
        const response = await fetch('/api/logud', {
            method: 'GET'
        });
        if (response.status === 200) {
            alert('Du er logget ud!');
            window.location = '/'; 
        } else {
            alert('Der opstod en fejl under log ud-processen.');
        }
    };

  </script>
  
  <style>

.container {
  position: relative;
}
.todo {
  flex: 3;
  margin: 20px;
  position: relative;
  left: 10px; /* Flytter sektionen til venstre */
}

.logo {
  flex: 1;
  width: 20%;
}

table {
  width: 80%;
  margin: 5px;
  border-collapse: collapse;
  margin-left: 280px; /* Justerer til højre for to do-sektionen */
  margin-top: -2px;
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

  button {
        background-color: #42a5f5;
        color: white; 
        border: none; 
        padding: 20px 30px; 
        margin: 5px; 
        border-radius: 10px; 
  }

  .logud{
    float: right;
    margin-top: -10px;
    }

    .tilbage{
    float: left;
    margin-top: -5px;
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
  
</main>

<div class="tilbage">
    <button on:click={navigationTostart}>Tilbage</button>
</div>

    <div class="logud">
        <button on:click={logout}>Log ud</button>    
    </div>