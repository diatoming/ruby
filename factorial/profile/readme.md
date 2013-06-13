The following commands were run to obtain a graph of the results:

```bash
> ruby-prof --mode=wall --printer=dot --file=profile.dot ../lib/factorial/factorial.rb 25
> dot -T pdf -o profile.pdf profile.dot
```

