using Gee;

public class Candidate : Object {
    public string name;
    public int votes;

    public Candidate(string name) {
        this.name = name;
        this.votes = 0;
    }
}

public class Voter : Object {
    GLib.Queue<int> votes;

    public Voter(int[] votes) {
        this.votes = new GLib.Queue<int>();

        foreach(int vote in votes)
            this.votes.push_tail(vote);
    }

    public int peek() {
        return votes.peek_head();
    }

    public int next() {
        votes.pop_head();
        return peek();
    }
}

void main() {
    int n, m;
    stdin.scanf("%d %d\n", out n, out m);

    var candidates = new HashMap<int, Candidate>();

    int key = 0;
    foreach(string name in stdin.read_line().split(" "))
        candidates[key++] = new Candidate(name);

    var voters = new Voter[n];

    for(int i = 0; i < n; i++) {
        voters[i] = new Voter(to_int_array(stdin.read_line().split(" ")));
        candidates[voters[i].peek()].votes++;
    }

    bool no_winner = true;
    int round = 1;
    Candidate winner = candidates[0];

    while(no_winner) {
        int lowest_score = int.MAX;

        stdout.printf("Round %d: ", round++);

        int i = 0;
        foreach(var candidate in sort_candidates(candidates.values.to_array())) {
            double score = (double) candidate.votes / n;

            stdout.printf("%.1f%% %s", score * 100, candidate.name);
            if(i++ < candidates.size - 1) print(", ");

            if(score > 0.5) {
                winner = candidate;
                no_winner = false;
            }

            if(candidate.votes < lowest_score)
                lowest_score = candidate.votes;
        }
        stdout.putc('\n');

        if(is_tie(candidates.values.to_array()))
            break;

        var losers = new ArrayList<int>();

        foreach(var candidate in candidates.entries)
            if(candidate.value.votes == lowest_score)
                losers.add(candidate.key);

        foreach(int loser in losers) {
            candidates.unset(loser);

            foreach(var voter in voters)
                if(voter.peek() == loser) {
                    while(!candidates.has_key(voter.next()));
                    candidates[voter.peek()].votes++;
                }
        }
    }

    if(no_winner)
        stdout.printf("Draw detected\n");
    else
        stdout.printf("%s is the winner\n", winner.name);
}

public Candidate[] sort_candidates(Candidate[] candidates) {
    for(int i = 0; i < candidates.length; i++)
        for(int j = i + 1; j < candidates.length; j++)
            if(candidates[i].votes < candidates[j].votes) {
                var temp = candidates[i];
                candidates[i] = candidates[j];
                candidates[j] = temp;
            }

    return candidates;
}

public bool is_tie(Candidate[] candidates) {
    for(int i = 0; i < candidates.length; i++)
        if(candidates[i].votes != candidates[0].votes)
            return false;

    return true;
}

public int[] to_int_array(string[] str_array) {
    int[] int_array = new int[str_array.length];

    for(int i = 0; i < str_array.length; i++)
        int_array[i] = int.parse(str_array[i]);

    return int_array;
}
