<script>
    import {goto} from '$app/navigation';
    let energi1 = [];
    let content = [
        "","","","",""
 ];

    $: last5 = energi1.slice(-5)

    const saveEnergi1 = async () => { 
        await fetch('/api/energi1', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(
                content
            )
        });
        
    }; 

    
    import { onMount } from 'svelte';
    onMount(async () => {
        const res = await fetch('/api/energi1/self');
        const previousEntries = await res.json();
        energi1 = await res.json();
        
    });

    
    async function inputknap(){
    const res = await fetch('/api/energi1/self');
        energi1 = await res.json();
        if (previousEntries.length > 5) {
        energi1 = previousEntries.slice(-5);
    } else {
        energi1 = previousEntries;
    }
        
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

<img src="/logo.png" alt="Logo">
<style> img{
    width: 30%;
}

    input[type="text"] {
        width: 500px; 
        height: 40px; 
        font-size: 16px; 
        margin-bottom: 20px;
    }


    button {
        background-color: #42a5f5;
        color: white; 
        border: none; 
        padding: 20px 30px; 
        margin: 5px; 
        border-radius: 10px; 
    }

    .inputknap {
    position: absolute; 
      top: 220px;
      right: 350px;
    }
    .logud{
    float: right;
    margin-top: 80px;
    }

    .save-button {
  margin-right: 300px; 
}

</style>

<h3>
    Hvad giver dig energi?
</h3>

{#each content as c}
<div>
    <input bind:value={c} type="text" placeholder="Skriv her"/>
</div>
{/each}

<div>
<button class="save-button" on:click={saveEnergi1}>Gem</button>
<button on:click={navigationTostart}>Tilbage</button>
</div>


<div class="logud">
    <button on:click={logout}>Log ud</button>    
</div>

<div class="inputknap">
    <button on:click={inputknap}>Input fra tidligere</button>
    {#each last5 as item}
    <div>
        <p>{item.content}</p>
    </div>
{/each}
</div>