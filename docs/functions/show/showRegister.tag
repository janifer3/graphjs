<docs-showRegister>
    <h1>{opts.label}</h1>
    <h2>Options</h2>
    <section class="options">
        <form>
            <fieldset name="title">
                <legend>Title</legend>
                <input onclick={updateTextWithCheckbox} type="checkbox" checked={specs.title} />
                <input onkeyup={updateTextWithCheckbox} type="text" value={specs.title} />
            </fieldset>
        </form>
    </section>
    <h2>Code</h2>
    <pre class="prettyprint"><xmp ref="inputCode" class="code">{input}</xmp></pre>
    <button onclick={handleSubmit}>Show</button>
    <script>
        import {updateShowFunction} from '../../scripts/updateCode.js';
        import showRegister from '../../../lib/scripts/showRegister.js';

        this.input = '';
        this.specs = {}

        this.on('mount', function() {
            updateShowFunction(opts.function, this.specs, this.refs.inputCode);
        });

        this.updateTextWithCheckbox = (event) => {
            let target = event.target.parentNode.name;
            if(event.target.type == 'checkbox') {
                let sibling = event.target.parentNode.children[2];
                event.target.checked ? this.specs[target] = sibling.value : delete this.specs[target];
            } else {
                let sibling = event.target.parentNode.children[1];
                this.specs[target] = event.target.value;
            }
            this.handleCode();
        }
        this.handleCode = () => {
            updateShowFunction(opts.function, this.specs, this.refs.inputCode);
        }
        this.handleSubmit = (event) => {
            event.preventDefault();
            showRegister(this.specs);
        }
    </script>
</docs-showRegister>
